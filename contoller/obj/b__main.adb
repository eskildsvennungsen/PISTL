pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E128 : Short_Integer; pragma Import (Ada, E128, "ada__text_io_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__tags_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings__text_buffers_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__bb__timing_events_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__soft_links_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__exception_table_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ada__streams_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__finalization_root_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ada__finalization_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__storage_pools_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__finalization_masters_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "ada__real_time_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "ada__real_time__timing_events_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "ada__strings__maps_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "ada__strings__unbounded_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__pool_global_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "system__tasking__protected_objects_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "system__tasking__restricted__stages_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "generic_timers_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "hal__gpio_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "hal__i2c_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "hal__spi_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__uart_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "lsm303agr_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "calculation_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "memory_barriers_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "cortex_m__nvic_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "nrf__events_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "nrf__gpio_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "nrf__interrupts_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "nrf__rtc_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "nrf__spi_master_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "nrf__tasks_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "nrf__clock_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "nrf__timers_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "nrf__twi_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "nrf__uart_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "nrf__device_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "microbit__console_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "microbit__displayrt_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "microbit__i2c_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "microbit__accelerometer_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "microbit__timewithrtc1_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "microbit__buttons_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "controller_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Text_Io'Elab_Body;
      E128 := E128 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E005 := E005 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E059 := E059 + 1;
      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E061 := E061 + 1;
      System.Exception_Table'Elab_Body;
      E096 := E096 + 1;
      E098 := E098 + 1;
      E012 := E012 + 1;
      Ada.Streams'Elab_Spec;
      E136 := E136 + 1;
      System.Finalization_Root'Elab_Spec;
      E142 := E142 + 1;
      Ada.Finalization'Elab_Spec;
      E140 := E140 + 1;
      System.Storage_Pools'Elab_Spec;
      E144 := E144 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E139 := E139 + 1;
      Ada.Real_Time'Elab_Body;
      E124 := E124 + 1;
      Ada.Real_Time.Timing_Events'Elab_Spec;
      E249 := E249 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E255 := E255 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E251 := E251 + 1;
      System.Pool_Global'Elab_Spec;
      E146 := E146 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E226 := E226 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E233 := E233 + 1;
      E267 := E267 + 1;
      HAL.GPIO'ELAB_SPEC;
      E167 := E167 + 1;
      HAL.I2C'ELAB_SPEC;
      E134 := E134 + 1;
      HAL.SPI'ELAB_SPEC;
      E181 := E181 + 1;
      HAL.UART'ELAB_SPEC;
      E191 := E191 + 1;
      LSM303AGR'ELAB_SPEC;
      LSM303AGR'ELAB_BODY;
      E132 := E132 + 1;
      E130 := E130 + 1;
      E224 := E224 + 1;
      E222 := E222 + 1;
      E217 := E217 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E161 := E161 + 1;
      E219 := E219 + 1;
      E176 := E176 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E179 := E179 + 1;
      E204 := E204 + 1;
      E202 := E202 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E183 := E183 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E186 := E186 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E189 := E189 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E152 := E152 + 1;
      Microbit.Console'Elab_Body;
      E238 := E238 + 1;
      Microbit.Displayrt'Elab_Body;
      E247 := E247 + 1;
      E195 := E195 + 1;
      Microbit.Accelerometer'Elab_Body;
      E193 := E193 + 1;
      Microbit.Timewithrtc1'Elab_Spec;
      Microbit.Timewithrtc1'Elab_Body;
      E199 := E199 + 1;
      Microbit.Buttons'Elab_Body;
      E197 := E197 + 1;
      Controller'Elab_Spec;
      Controller'Elab_Body;
      E122 := E122 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\LENOVO\Documents\dev\22H\ADA\VE3140-22H\obj\calculation.o
   --   C:\Users\LENOVO\Documents\dev\22H\ADA\VE3140-22H\obj\controller.o
   --   C:\Users\LENOVO\Documents\dev\22H\ADA\VE3140-22H\obj\main.o
   --   -LC:\Users\LENOVO\Documents\dev\22H\ADA\VE3140-22H\obj\
   --   -LC:\Users\LENOVO\Documents\dev\22H\ADA\VE3140-22H\obj\
   --   -LC:\Users\LENOVO\Documents\dev\22H\ADA\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
