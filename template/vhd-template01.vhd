-- file   %file-name%
-- brief  %file-name-no-ext% Ver 0.01
-- author %id%
-- date   %date-T1%
-- note   C-c C-b :: format vhdl file

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity %file-name-no-ext% is
  -- generic();
  port(
    -- name: {in,out} type
);
end %file-name-no-ext%;

architecture RTL of %file-name-no-ext% is
  -- signal name: type;
begin

  process()
  begin
  end process;

end RTL;
