defmodule HWFacts do
  @moduledoc """
  HWFacts - collect and parse system metrics
  Current module:

  #### Disk
  #### Mem <coming soon>
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      alias HWFacts.Disk, as: HWDisk
      # alias HWFacts.Mem,  as: HWMem
    end
  end
end
