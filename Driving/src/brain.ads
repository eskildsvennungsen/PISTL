with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
package Brain is

   protected myBrain is
      function GetMeasurementSensor1 return Radio.RadioData; -- concurrent read operations are now possible
      function GetMeasurementSensor2 return Integer; -- concurrent read operations are now possible
  
      procedure SetMeasurementSensor1 (V : Radio.RadioData); -- but concurrent read/write are not!
      procedure SetMeasurementSensor2 (V : Integer); -- but concurrent read/write are not!
   private
      MeasurementSensor2 : Integer;
      RXdata1 : Radio.RadioData;
   end myBrain;

end Brain;
