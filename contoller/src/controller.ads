with HAL; use HAL;
with Calculation; use Calculation;

package Controller is

   type DrivingDirection is (
                             STANDBY, --0
                             NORTH, --1
                             SOUTH, --2
                             WEST, --3
                             EAST, --4
                             ROTATECLOCKWISE, --5
                             ROTATECOUNTERCLOCKWISE --6
                            );
   protected DirectionHandler is
      function ReadData return DrivingDirection;
      procedure WriteDirection (normalizedData : NormalizedAxisDataSet);
      private
      data : DrivingDirection := STANDBY;
   end DirectionHandler;
   task SendData with Priority => 3;
   task Accelerometer with Priority => 2;


end Controller;
