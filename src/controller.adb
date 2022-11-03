with LSM303AGR; use LSM303AGR;

with Calculation; use Calculation;

with MicroBit.Console;
with MicroBit.Accelerometer;
with MicroBit.Buttons; use MicroBit.Buttons;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;

package body Controller is

   task body Accelerometer is
      data : All_Axes_Data;
      time_now : Ada.Real_Time.Time;
      button : MicroBit.Buttons.Button_Id := Button_A;
      normalizedData : NomralizedAxisDataSet;
   begin
      loop

         time_now := Ada.Real_Time.Clock;
         if MicroBit.Buttons.State(Button_A) = Pressed then
            data := MicroBit.Accelerometer.AccelData;
            normalizedData := NormalizeAxisData(data);
            Put_Line (
                "X:"  & normalizedData.X'Img & "|" &
                "Y:"  & normalizedData.Y'Img & "|" &
                "Z:"  & normalizedData.Z'Img
                     );
      end if;
      delay until time_now + Ada.Real_Time.Milliseconds(100);
      end loop;
   end Accelerometer;


end Controller;
