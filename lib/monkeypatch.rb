require "google_drive"
require "fileutils"

module MonkeyPatch
  def download_to_file(path, params = {})
    @session.drive_service.get_file(
      id,
      download_dest: path, supports_all_drives: true, **params
    )
  end
end
GoogleDrive::File.prepend(MonkeyPatch)
