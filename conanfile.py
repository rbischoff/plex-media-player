from conans import ConanFile, CMake
import os

class PlexMediaPlayer(ConanFile):
  settings = "os", "compiler", "build_type", "arch"
  options = {"include_desktop": [True, False]}
  default_options = "include_desktop=True"
  generators = "cmake"

  def requirements(self):
    self.requires("web-client-tv2/3.28.0-f8b4c1e6@plex/public")

    if self.options.include_desktop:
      self.requires("web-client-desktop/3.26.2-3d9c616@plex/public")
