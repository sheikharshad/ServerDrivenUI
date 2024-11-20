//
//  Helpers.swift
//  ServerDrivenUITests
//
//  Created by Arshad shaikh on 19/11/2024.
//

import Foundation

final class TestHelpers {

    static let mockValidJSON = """
    {

        "screens": [{

            "id": "test-screen",

            "components": [{

                "componentType": "Text",

                "text": "Test"

            }]

        }],

        "events": [{

            "type": "SUBMIT",

            "actions": [{

                "type": "log",

                "args": [{"testField": "test"}]

            }]

        }]

    }

    """

}
