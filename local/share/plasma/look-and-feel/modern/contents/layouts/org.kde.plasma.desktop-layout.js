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
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "540",
                    "DialogWidth": "720"
                },
                "/General": {
                    "alignment": "1",
                    "arrangement": "1",
                    "positions": "1,7,desktop:/trash.desktop,0,1,desktop:/Home.desktop,0,0",
                    "showToolbox": "false",
                    "sortMode": "-1"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        },
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "540",
                    "DialogWidth": "720"
                },
                "/General": {
                    "alignment": "1",
                    "arrangement": "1",
                    "showToolbox": "false",
                    "sortMode": "-1"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "left",
            "applets": [
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration": {
                            "immutability": "1"
                        },
                        "/Configuration/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/Configuration/Configuration/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/Configuration/Configuration/General": {
                            "favoriteApps": "systemsettings.desktop,org.kde.dolphin.desktop,org.kde.kate.desktop"
                        },
                        "/Configuration/General": {
                            "favoriteApps": ""
                        },
                        "/Configuration/Shortcuts": {
                            "global": "F1"
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
                        },
                        "/Configuration": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.appmenu"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration": {
                            "immutability": "1"
                        },
                        "/Configuration/Configuration/General": {
                            "length": "1583"
                        },
                        "/Configuration/General": {
                            "length": "1583"
                        }
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "immutability": "1"
                        },
                        "/Configuration": {
                            "immutability": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
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
                    "DialogHeight": "84",
                    "DialogWidth": "1920"
                }
            },
            "height": 1.5,
            "hiding": "normal",
            "location": "top",
            "maximumLength": 106.66666666666667,
            "minimumLength": 106.66666666666667,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
