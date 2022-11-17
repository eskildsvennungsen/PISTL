with LSM303AGR; use LSM303AGR;

with Calculation; use Calculation;

with MicroBit.Console; use MicroBit.Console;
with MicroBit.Accelerometer;
with MicroBit.Buttons; use MicroBit.Buttons;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;

-- Packages for sending data over radio
with MicroBit.Radio;
with HAL; use HAL;
with nRF.Radio;

package body Controller is


   task body Accelerometer is
      data : All_Axes_Data;
      time_now : Ada.Real_Time.Time;
      normalizedData : NormalizedAxisDataSet;
   begin
      loop
         time_now := Ada.Real_Time.Clock;
         data := MicroBit.Accelerometer.AccelData;
         normalizedData := NormalizeAxisData(data);
         DirectionHandler.WriteDirection(normalizedData);
         delay until time_now + Ada.Real_Time.Milliseconds(100);
      end loop;
   end Accelerometer;

   protected body DirectionHandler is

      function ReadData return DrivingDirection is
      begin
         return data;
      end ReadData;

      procedure WriteDirection (normalizedData : NormalizedAxisDataSet) is
      begin
         if MicroBit.Buttons.State(Button_A) = Pressed then
            data := ROTATECOUNTERCLOCKWISE;
         elsif MicroBit.Buttons.State(Button_B) = Pressed then
            data := ROTATECLOCKWISE;
         elsif (normalizedData.X > 0.43 and normalizedData.X < 0.57) and (normalizedData.Y > 0.43 and normalizedData.Y < 0.57) then
            data := STANDBY;
         elsif (normalizedData.X > 0.45 and normalizedData.X < 0.55) and (normalizedData.Y > 0.6) then
            data:= NORTH;
         elsif (normalizedData.X > 0.45 and normalizedData.X < 0.55) and (normalizedData.Y < 0.45) then
            data := SOUTH;
         elsif (normalizedData.X > 0.55) and (normalizedData.Y > 0.45 and normalizedData.Y < 0.55) then
            data := WEST;
         elsif (normalizedData.X < 0.45) and (normalizedData.Y > 0.45 and normalizedData.Y < 0.55) then
            data := EAST;

         end if;

      end WriteDirection;

   end DirectionHandler;

   task body SendData is
      dataToSend : Radio.RadioData;
      time_now : Ada.Real_Time.Time;
      direction : UInt8;
   begin
      dataToSend.Length := 5;
      dataToSend.Version:= 12;
      dataToSend.Group := 1;
      dataToSend.Protocol := 14;

      Radio.Setup(RadioFrequency => 2410,
                  Length => dataToSend.Length,
                  Version => dataToSend.Version,
                  Group => dataToSend.Group,
                  Protocol => dataToSend.Protocol);
         loop
         direction := UInt8(DrivingDirection'Pos(DirectionHandler.ReadData));
         time_now := Ada.Real_Time.Clock;
         dataToSend.Payload(1) := direction;
         Ada.Text_IO.Put_Line("Payload: " & UInt8'Image(dataToSend.Payload(1)));
         Radio.Transmit(dataToSend);
         delay until time_now + Ada.Real_Time.Milliseconds(100);
      end loop;

   end SendData;

end Controller;
