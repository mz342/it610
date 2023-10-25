class SwiftlyCMS:
    def __init__(self, config_file):
        self.config_file = config_file

    def start_server(self):
        from flask import Flask
        app = Flask(__name__)

        @app.route('/')
        def hello_world():
            return 'Hello, Swiftly CMS!'

        if __name__ == '__main__':
            app.run(host='0.0.0.0', port=80)  # Adjust host and port as needed


if __name__ == "__main__":
    # Code here will run when this script is executed directly
    config_file = "/project/config/swiftly.conf"  # Adjust this path as needed
    swiftly_cms = SwiftlyCMS(config_file)
    swiftly_cms.start_server()

