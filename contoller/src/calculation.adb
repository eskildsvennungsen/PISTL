with Ada.Text_IO; use Ada.Text_IO;

package body Calculation is

   function Normalize(data : LSM303AGR.Axis_Data) return NormalizedAxisData is
      new_data : Float := Float(data);
      min_value : Float := -2.0**8;
      max_value : Float := 2.0**8 - 1.0;
      returnData : NormalizedAxisData;
        
   begin
      if new_data > 255.0 then new_data := 255.0;
      elsif new_data < -256.0 then new_data := -256.0; end if;
      returnData := NormalizedAxisData((new_data - min_value)/(max_value - min_value));
      return returnData;
   end;
   
   
   function NormalizeAxisData (data : LSM303AGR.All_Axes_Data) return NomralizedAxisDataSet is
      dataSet : NomralizedAxisDataSet;
   begin
      dataSet.X := Normalize(data.X);
      dataSet.Y := Normalize(data.Y);
      dataSet.Z := Normalize(data.Z);
      return (dataSet);
   end NormalizeAxisData;
   
end Calculation;









