cmake_minimum_required(VERSION 3.16)

project(text_transfer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml Network)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apptext_transfer
    main.cpp
)

qt_add_qml_module(apptext_transfer
    URI text_transfer
    QML_FILES
        Main.qml
        QML_FILES DialogLib.qml
        SOURCES firebase.h firebase.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptext_transfer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptext_transfer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptext_transfer
    PRIVATE Qt6::Widgets Qt6::Quick Qt6::Qml Qt6::Network
)
target_link_libraries(apptext_transfer PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS apptext_transfer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if (EMSCRIPTEN)
    target_compile_definitions(apptext_transfer PRIVATE QT_WASM_BUILD)
endif()

if (ANDROID)
    include(C:/Users/nsopr/AppData/Local/Android/Sdk/android_openssl/android_openssl.cmake)
    add_android_openssl_libraries(appToDo)
    find_package(Qt6Keychain REQUIRED)
    target_link_libraries(apptext_transfer PRIVATE qt6keychain)

endif()
