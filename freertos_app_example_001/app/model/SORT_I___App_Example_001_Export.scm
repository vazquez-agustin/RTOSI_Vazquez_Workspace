{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "SORT I - App Example 001 Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event ENTRY_A\n    in event EXIT_A\n    in event ENTRY_B\n    in event EXIT_B\n\ninternal:\n    event STOP_A\n    event GO_A\n    event STOP_B\n    event GO_B"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -1840,
          "y": 20
        },
        "size": {
          "height": 235,
          "width": 270
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "marker": [
          "Region must have a 'default' entry."
        ],
        "z": 788,
        "id": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "embeds": [
          "d6446cd5-6bbc-4f4c-8d78-676751bc857e",
          "6d066d89-2881-4456-bd01-0653c150b6bc",
          "fa43c666-2ca7-43fd-9a0c-83d17bfcdbda",
          "567684c8-fedc-4ce4-913d-8174e997ecd5",
          "43022ac9-63c6-4b88-8cef-778753a5e519",
          "93a1fc4e-6234-44c6-b373-094afef58645"
        ],
        "attrs": {
          "priority": {
            "text": 2
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -1800,
          "y": 40
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "marker": [
          "Initial entry must have an outgoing transition."
        ],
        "z": 789,
        "id": "567684c8-fedc-4ce4-913d-8174e997ecd5",
        "embeds": [
          "b295c8a9-07a3-40a3-95ac-719bf2ab48ca"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": -1713.4812488555908,
          "y": 40
        },
        "size": {
          "height": 60,
          "width": 71.01250076293945
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "marker": [
          "This state's completion transition results in an infinite cycle."
        ],
        "z": 790,
        "id": "43022ac9-63c6-4b88-8cef-778753a5e519",
        "attrs": {
          "name": {
            "text": "GREEN_A"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -1721.3875007629395,
          "y": 167.5
        },
        "size": {
          "height": 60,
          "width": 71.01250076293945
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "marker": [
          "This state's completion transition results in an infinite cycle."
        ],
        "z": 791,
        "id": "93a1fc4e-6234-44c6-b373-094afef58645",
        "attrs": {
          "name": {
            "text": "RED_A"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -1800,
          "y": 55
        },
        "parent": "567684c8-fedc-4ce4-913d-8174e997ecd5",
        "z": 795,
        "id": "b295c8a9-07a3-40a3-95ac-719bf2ab48ca",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "93a1fc4e-6234-44c6-b373-094afef58645"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 53.48124694824219,
              "dy": 55.74119186401367
            },
            "name": "topLeft"
          },
          "id": "43022ac9-63c6-4b88-8cef-778753a5e519",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "GO_A"
              }
            },
            "position": {
              "offset": 25,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "marker": [
          "Could not find declaration of GO_A\nTrigger 'GO_A' is no event."
        ],
        "z": 796,
        "id": "6d066d89-2881-4456-bd01-0653c150b6bc",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "43022ac9-63c6-4b88-8cef-778753a5e519"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 33.48124694824219,
              "dy": 17.241195678710938
            },
            "name": "topLeft"
          },
          "id": "93a1fc4e-6234-44c6-b373-094afef58645",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "STOP_A"
              }
            },
            "position": {
              "offset": 35,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "vertices": [],
        "marker": [
          "Could not find declaration of STOP_A\nTrigger 'STOP_A' is no event."
        ],
        "z": 796,
        "id": "d6446cd5-6bbc-4f4c-8d78-676751bc857e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "567684c8-fedc-4ce4-913d-8174e997ecd5"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 13.481246948242188,
              "dy": 45.74119186401367
            },
            "name": "topLeft"
          },
          "id": "43022ac9-63c6-4b88-8cef-778753a5e519",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "1fe66855-6e8a-4306-8765-26cc436a8fea",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "z": 796,
        "id": "fa43c666-2ca7-43fd-9a0c-83d17bfcdbda",
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": -1840,
          "y": 284
        },
        "size": {
          "height": 235,
          "width": 550
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "marker": [
          "Region must have a 'default' entry."
        ],
        "z": 818,
        "id": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "embeds": [
          "a7bb963d-e8cf-4975-9987-78d0e16c0194",
          "309be181-2010-49b0-9c94-4cb594ea7a33",
          "581dce60-5d50-4814-96ff-58ef8e734bfc",
          "08e47c02-3c60-4c41-9175-e434e048977d",
          "e8177a5d-f7e2-4f3d-9858-587b587104b6",
          "6c43e41a-584f-4d34-bf18-671dc73f54f9",
          "6bde0365-0d43-4908-8636-57e0097c836d",
          "25601cbb-e969-4796-8d81-89707f37cb6f",
          "0726e8ae-56c3-478a-9da7-6ff94387b64e"
        ],
        "attrs": {
          "priority": {
            "text": 1
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -1815,
          "y": 371.49999237060547
        },
        "size": {
          "height": 60.40000343322754,
          "width": 164.625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "marker": [
          "Could not find declaration of STOP_A<br>Could not find declaration of STOP_B<br>'' is not an event."
        ],
        "z": 819,
        "id": "6c43e41a-584f-4d34-bf18-671dc73f54f9",
        "attrs": {
          "name": {
            "text": "GATEWAY_A"
          },
          "specification": {
            "text": "entry/raise STOP_A\nentry/raise STOP_B"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -1466.8062496185303,
          "y": 371.49999237060547
        },
        "size": {
          "height": 60.40000343322754,
          "width": 164.625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "marker": [
          "Could not find declaration of STOP_A<br>Could not find declaration of STOP_B<br>'' is not an event."
        ],
        "z": 820,
        "id": "6bde0365-0d43-4908-8636-57e0097c836d",
        "attrs": {
          "name": {
            "text": "GATEWAY_B"
          },
          "specification": {
            "text": "entry/raise STOP_A\nentry/raise STOP_B"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -1630,
          "y": 371.49999237060547
        },
        "size": {
          "height": 60.40000343322754,
          "width": 150.22727966308594
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "marker": [
          "Could not find declaration of GO_A<br>Could not find declaration of GO_B<br>'' is not an event."
        ],
        "z": 821,
        "id": "25601cbb-e969-4796-8d81-89707f37cb6f",
        "attrs": {
          "name": {
            "text": "IDLE"
          },
          "specification": {
            "text": "entry/raise GO_A\nentry/raise GO_B"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -1560,
          "y": 298.5
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "marker": [
          "Initial entry must have an outgoing transition."
        ],
        "z": 822,
        "id": "0726e8ae-56c3-478a-9da7-6ff94387b64e",
        "embeds": [
          "7d59fda4-3cea-4749-a0a8-96375dbcc5bc"
        ],
        "attrs": {}
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -1560,
          "y": 313.5
        },
        "parent": "0726e8ae-56c3-478a-9da7-6ff94387b64e",
        "z": 828,
        "id": "7d59fda4-3cea-4749-a0a8-96375dbcc5bc",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "0726e8ae-56c3-478a-9da7-6ff94387b64e"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 30,
              "dy": 13.699996948242188
            },
            "name": "topLeft"
          },
          "id": "25601cbb-e969-4796-8d81-89707f37cb6f",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {
              "distance": 0,
              "offset": 11.259859355813283,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "vertices": [
          {
            "x": -1592.5,
            "y": 308.5
          }
        ],
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "z": 829,
        "id": "a7bb963d-e8cf-4975-9987-78d0e16c0194",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "25601cbb-e969-4796-8d81-89707f37cb6f"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 12.753143310546875,
              "dy": 33.69999694824219
            },
            "name": "topLeft"
          },
          "id": "6bde0365-0d43-4908-8636-57e0097c836d",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ENTRY_B"
              }
            },
            "position": {
              "distance": 0.5171882367846936,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          }
        ],
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "vertices": [
          {
            "x": -1454.0562503814697,
            "y": 336
          }
        ],
        "marker": [
          "Could not find declaration of ENTRY_B\nTrigger 'ENTRY_B' is no event."
        ],
        "z": 829,
        "id": "08e47c02-3c60-4c41-9175-e434e048977d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6bde0365-0d43-4908-8636-57e0097c836d"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 50,
              "dy": 63.69999694824219
            },
            "name": "topLeft"
          },
          "id": "25601cbb-e969-4796-8d81-89707f37cb6f",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EXIT_B"
              }
            },
            "position": {
              "distance": 0.404494161056771,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "vertices": [
          {
            "x": -1505.5062503814697,
            "y": 466
          }
        ],
        "marker": [
          "Could not find declaration of EXIT_B\nTrigger 'EXIT_B' is no event."
        ],
        "z": 829,
        "id": "309be181-2010-49b0-9c94-4cb594ea7a33",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "25601cbb-e969-4796-8d81-89707f37cb6f"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 60.50625038146973,
              "dy": 33.69999694824219
            },
            "name": "topLeft"
          },
          "id": "6c43e41a-584f-4d34-bf18-671dc73f54f9",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ENTRY_A"
              }
            },
            "position": {
              "distance": 0.7076315477355142,
              "offset": 15,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "vertices": [
          {
            "x": -1625.5062503814697,
            "y": 328.5
          },
          {
            "x": -1730,
            "y": 328.5
          }
        ],
        "marker": [
          "Could not find declaration of ENTRY_A\nTrigger 'ENTRY_A' is no event."
        ],
        "z": 829,
        "id": "e8177a5d-f7e2-4f3d-9858-587b587104b6",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6c43e41a-584f-4d34-bf18-671dc73f54f9"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 30,
              "dy": 63.69999694824219
            },
            "name": "topLeft"
          },
          "id": "25601cbb-e969-4796-8d81-89707f37cb6f",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EXIT_A"
              }
            },
            "position": {
              "distance": 0.4146737215152119,
              "offset": 15,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "8522f668-a506-4a4a-9a93-fd1bdb1626df",
        "vertices": [
          {
            "x": -1730,
            "y": 441.5
          },
          {
            "x": -1620,
            "y": 469
          }
        ],
        "marker": [
          "Could not find declaration of EXIT_A\nTrigger 'EXIT_A' is no event."
        ],
        "z": 829,
        "id": "581dce60-5d50-4814-96ff-58ef8e734bfc",
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": -1545,
          "y": 30
        },
        "size": {
          "height": 235,
          "width": 220
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "marker": [
          "Region must have a 'default' entry."
        ],
        "z": 830,
        "id": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "embeds": [
          "e6f6a106-2e65-4c48-abcc-41be4d1ecb29",
          "b67f876e-4a68-4feb-b318-4924308d5429",
          "07edeba8-65a5-4b20-b3ab-3aa7dc1cbf3c",
          "57aaa07d-b975-4dfe-b4aa-885c2e8c4139",
          "fa928452-97af-43ab-a0aa-d0b75145f68f",
          "9ba27808-ec83-4f15-9d01-59ecd6d928c3"
        ],
        "attrs": {
          "priority": {
            "text": 3
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -1534.9999237060547,
          "y": 52.5
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "marker": [
          "Initial entry must have an outgoing transition."
        ],
        "z": 831,
        "id": "57aaa07d-b975-4dfe-b4aa-885c2e8c4139",
        "embeds": [
          "f9f5494c-e9e1-4e4a-a6af-c214712c9158"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": -1444.9999389648438,
          "y": 177.5
        },
        "size": {
          "height": 60,
          "width": 71.01250076293945
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "marker": [
          "This state's completion transition results in an infinite cycle."
        ],
        "z": 832,
        "id": "fa928452-97af-43ab-a0aa-d0b75145f68f",
        "attrs": {
          "name": {
            "text": "RED_B"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -1444.9999389648438,
          "y": 50
        },
        "size": {
          "height": 60,
          "width": 71.01250076293945
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "marker": [
          "This state's completion transition results in an infinite cycle."
        ],
        "z": 833,
        "id": "9ba27808-ec83-4f15-9d01-59ecd6d928c3",
        "attrs": {
          "name": {
            "text": "GREEN_B"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -1534.9999237060547,
          "y": 67.5
        },
        "parent": "57aaa07d-b975-4dfe-b4aa-885c2e8c4139",
        "z": 837,
        "id": "f9f5494c-e9e1-4e4a-a6af-c214712c9158",
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "9ba27808-ec83-4f15-9d01-59ecd6d928c3"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 20.00006866455078,
              "dy": 20.7412109375
            },
            "name": "topLeft"
          },
          "id": "fa928452-97af-43ab-a0aa-d0b75145f68f",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "STOP_B"
              }
            },
            "position": {
              "offset": 35,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "marker": [
          "Could not find declaration of STOP_B\nTrigger 'STOP_B' is no event."
        ],
        "z": 838,
        "id": "07edeba8-65a5-4b20-b3ab-3aa7dc1cbf3c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fa928452-97af-43ab-a0aa-d0b75145f68f"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 50,
              "dy": 55.7411994934082
            },
            "name": "topLeft"
          },
          "id": "9ba27808-ec83-4f15-9d01-59ecd6d928c3",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "GO_B"
              }
            },
            "position": {
              "offset": 25,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "marker": [
          "Could not find declaration of GO_B\nTrigger 'GO_B' is no event."
        ],
        "z": 838,
        "id": "e6f6a106-2e65-4c48-abcc-41be4d1ecb29",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "57aaa07d-b975-4dfe-b4aa-885c2e8c4139"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": 20,
              "dy": 35.7411994934082
            },
            "name": "topLeft"
          },
          "id": "9ba27808-ec83-4f15-9d01-59ecd6d928c3",
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          }
        ],
        "parent": "cd29dd0f-fece-4f49-a5ba-90ea50b99278",
        "z": 838,
        "id": "b67f876e-4a68-4feb-b318-4924308d5429",
        "attrs": {}
      }
    ]
  },
  "genModel": {
    "generator": {
      "schemaKey": "yakindu::c",
      "LicenseHeader": {
        "licenseText": ""
      },
      "FunctionInlining": {
        "inlineReactions": false,
        "inlineEntryActions": false,
        "inlineExitActions": false,
        "inlineEnterSequences": false,
        "inlineExitSequences": false,
        "inlineChoices": false,
        "inlineEnterRegion": false,
        "inlineExitRegion": false,
        "inlineEntries": false
      },
      "OutEventAPI": {
        "observables": false,
        "getters": false
      },
      "IdentifierSettings": {
        "moduleName": "SortIAppExample001",
        "statemachinePrefix": "sortIAppExample001",
        "separator": "_",
        "headerFilenameExtension": "h",
        "sourceFilenameExtension": "c"
      },
      "Tracing": {
        "enterState": false,
        "exitState": false,
        "generic": false
      },
      "Includes": {
        "useRelativePaths": false
      },
      "GeneratorOptions": {
        "userAllocatedQueue": false,
        "metaSource": false
      },
      "GeneralFeatures": {
        "timerService": false
      }
    }
  }
}