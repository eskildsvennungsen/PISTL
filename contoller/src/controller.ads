with HAL; use HAL;
with Calculation; use Calculation;

package Controller is

   type DrivingDirection is (
                             STANDBY,
                             NORTH,
                             SOUTH,
                             WEST,
                             EAST,
                             ROTATECLOCKWISE,
                             ROTATECOUNTERCLOCKWISE
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
