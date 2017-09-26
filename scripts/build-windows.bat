cd %BUILD_DIR%  || exit /b

if exist ../conanfile.py (
  conan remove web-client-tv/3.13.2-cb96c53@plex/public -f
  conan install ..
)

%CMAKE_DIR%\cmake -DDEPENDENCY_TOKEN=%DEP_SECRET% -DCRASHDUMP_SECRET=%CD_SECRET% -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=output -DDEPENDENCY_UNTAR_DIR=c:\jenkins\pmp-deps .. -G Ninja -DCODE_SIGN=ON -DENABLE_CODECS=on || exit /b

ninja || exit /b
ninja windows_package || exit /b
