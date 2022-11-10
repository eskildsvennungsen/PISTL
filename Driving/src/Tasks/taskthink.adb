With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
package body TaskThink is

  task body think is
      myClock : Time;
      RXdata : Radio.RadioData;
   begin
      loop
        myClock := Clock;
         RXdata:= myBrain.GetMeasurementSensor1;
         --make a decision (could be wrapped nicely in a procedure)
     if RXdata.Payload(1)=0  then            
            MotorDriver.SetDirection (Stop); --our decision what to do based on the sensor values        
         elsif RXdata.Payload(1)=1  then
            MotorDriver.SetDirection (Forward);
            elsif RXdata.Payload(1)=2  then
            MotorDriver.SetDirection (left);
            elsif RXdata.Payload(1)=3  then
            MotorDriver.SetDirection (right);
            elsif RXdata.Payload(1)=4  then
            MotorDriver.SetDirection (backwards);
            elsif RXdata.Payload(1)=5  then
            MotorDriver.SetDirection (leftUp);
            elsif RXdata.Payload(1)=6  then
            MotorDriver.SetDirection (rightUp);
            elsif RXdata.Payload(1)=7  then
            MotorDriver.SetDirection (leftDown);
            elsif RXdata.Payload(1)=8  then
            MotorDriver.SetDirection (leftUp);
            elsif RXdata.Payload(1)=9  then
            MotorDriver.SetDirection (rightUp);
            elsif RXdata.Payload(1)=10  then
            MotorDriver.SetDirection (turnLeft);
            elsif RXdata.Payload(1)=11  then
            MotorDriver.SetDirection (turnRight);
         else
            MotorDriver.SetDirection (Stop); 
         end if;
    --   Put("Raven Received D1: " & UInt8'Image(GetMeasurementSensor1.Payload(1)));
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
