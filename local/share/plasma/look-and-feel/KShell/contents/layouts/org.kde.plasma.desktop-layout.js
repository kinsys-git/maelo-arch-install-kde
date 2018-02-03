var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "600",
                    "DialogWidth": "800"
                },
                "/General": {
                    "showToolbox": "false"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "right",
            "applets": [
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration/General": {
                            "length": "1233"
                        }
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration/General": {
                            "length": "861"
                        }
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.systemtray"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "85",
                    "DialogWidth": "1920"
                }
            },
            "height": 2,
            "hiding": "normal",
            "location": "top",
            "maximumLength": 1000,
            "minimumLength": 1000,
            "offset": 0
        },
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration/ConfigDialog": {
                            "DialogHeight": "600",
                            "DialogWidth": "800"
                        },
                        "/Configuration/General": {
                            "favoriteApps": "preferred://browser,systemsettings.desktop,org.kde.dolphin.desktop"
                        },
                        "/Shortcuts": {
                            "global": "Meta+F1"
                        }
                    },
                    "plugin": "org.kde.plasma.kickerdash"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "3",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "1080",
                    "DialogWidth": "178"
                }
            },
            "height": 3.5,
            "hiding": "autohide",
            "location": "left",
            "maximumLength": 54,
            "minimumLength": 25.7,
            "offset": 0
        },
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.pagermod"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "3",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "1080",
                    "DialogWidth": "180"
                }
            },
            "height": 12.5,
            "hiding": "autohide",
            "location": "right",
            "maximumLength": 23.9,
            "minimumLength": 23.9,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
