with HAL; use HAL;
with Calculation; use Calculation;

package Controller is

   type DrivingDirection is (
                             STANDBY,
                             NORTH,
                             SOUTH,
                             WEST,
                             EAST,
                             NORTHWEST,
                             NORTHEAST,
                             SOUTHWEST,
                             SOUTHEAST,
                             ROTATECLOCKWISE,
                             ROTATECOUNTERCLOCKWISE
                            );
   protected DirectionHandler is
      function ReadData return DrivingDirection;
      procedure WriteDirection (n : NormalizedAxisDataSet);
      private
      data : DrivingDirection := NORTHWEST;
   end DirectionHandler;
   task SendData with Priority => 3;
   task Accelerometer with Priority => 2;


end Controller;
