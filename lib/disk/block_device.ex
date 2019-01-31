defmodule HWFacts.Disk.BlockDevice do
  @moduledoc """
    The struct to hold formated lsbkl -f data for Storage.
    ## Examples
        iex> blk = %BlockDevice{
          name: "sda1",
          fs_type: "ext4",
          uuid: "06b2aae3-b525-4a4c-9549-0fc6045bd08e",
          mount_point: "/es",
          is_formatted: true
        }
        ...> blk.uuid
        "06b2aae3-b525-4a4c-9549-0fc6045bd08e"
  """

  @type t :: %__MODULE__{
    name: binary,
    fs_type: binary,
    uuid: binary,
    mount_point: binary,
    is_formatted: boolean
  }

  defstruct [
    name: "",
    fs_type: "",
    uuid: "",
    mount_point: "",
    is_formatted: false
  ]
end