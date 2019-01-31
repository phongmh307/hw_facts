defmodule HWFacts.Disk do
  alias HWFacts.Disk.{ BlockDevice }

  @moduledoc """
  Providing functions to deal with disk metrics
  """

  @doc """
  Return the list of all block devices on this host
  Formatted to BlockDevice struct
  """
  @spec show_blks() :: [%HWFacts.Disk.BlockDevice{}]
  def show_blks do
    try do
      case System.cmd "lsblk", ["-f"] do
        {output, 0} ->
          String.split(output, "\n")
          |> Enum.filter(&(String.starts_with?(&1, "└─")))
          |> Enum.map(
            fn(row) ->
              regex = ~r/^└─(\w+)\s+(\w+)\s+([0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12})\s(\/[\w+]?)/
              case Regex.run(regex, row) do
                [_, name] ->
                  %BlockDevice{
                    name: name,
                    is_formatted: false
                  }
                [_, name, fs_type, uuid, mount_point] ->
                  %BlockDevice{
                    name: name,
                    fs_type: fs_type,
                    uuid: uuid,
                    mount_point: mount_point,
                    is_formatted: true
                  }
              end
            end)
      end
    rescue
      error ->
        case error do
          %ErlangError{original: reason} -> reason
          _ -> IO.inspect error
        end
    end
  end
end