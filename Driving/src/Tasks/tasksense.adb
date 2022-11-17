With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;

package body TaskSense is

    task body sense is
      myClock : Time;
      tempRXdata : Radio.RadioData;
      TxData : Radio.RadioData;
   begin
      TxData.Length := 5;
      TxData.Version:= 12;
      TxData.Group := 1;
      TxData.Protocol := 14;

      Radio.Setup(RadioFrequency => 2410,
                  Length => TxData.Length,
                  Version => TxData.Version,
                  Group => TxData.Group,
                  Protocol => TxData.Protocol);
      Radio.StartReceiving;
      Put_Line(Radio.State);
      loop
         
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         delay (0.024); --simulate a sensor eg the ultrasonic sensors needs at least 24ms for 400cm range.
   
            while Radio.DataReady loop
         Put("Raven Received D1: " & UInt8'Image(tempRXdata.Payload(1)));
            myBrain.SetMeasurementSensor1 (Radio.Receive); -- random value, hook up a sensor here!
         end loop;
         delay until myClock + Milliseconds(120); --random period
      end loop;
   end sense;

end TaskSense;
