with LSM303AGR; use LSM303AGR;

package Calculation is
   
   type NormalizedAxisData is digits 4 range 0.0 .. 1.0;
   type NormalizedAxisDataSet is record
      X, Y, Z : NormalizedAxisData;
   end record;
   
   function NormalizeAxisData (Data : LSM303AGR.All_Axes_Data) return NormalizedAxisDataSet;
   function Normalize (data : LSM303AGR.Axis_Data) return NormalizedAxisData;
   
end Calculation;
