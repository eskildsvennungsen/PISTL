with Controller; use Controller;
with MicroBit.DisplayRT; use MicroBit.DisplayRT;

procedure Main with Priority => 0 is

begin
   loop
      Display("A");
      null;
   end loop;
end Main;
