class LoginHtmlContent {
  static const String loginHtmlContent = '''<html>
<head>
    <script>
        var loadJS = function (url, implementationCode, location) {
            var scriptTag = document.createElement('script');
            scriptTag.src = url;
            scriptTag.onload = implementationCode;
            scriptTag.onreadystatechange = implementationCode;
            location.appendChild(scriptTag);
        };
        function initKeycloak() {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const authServerUrl = urlParams.get('authServerUrl')
            const clientId = urlParams.get('clientId')
            const realm = urlParams.get('realm')
            loadJS(authServerUrl + "/js/keycloak.js", () => {
                const keycloak = new Keycloak({ authServerUrl: authServerUrl, clientId: clientId, realm: realm });
                keycloak.init({ onLoad: 'login-required' }).then(function () {
                    MessageToFlutter.postMessage(JSON.stringify(keycloak));
                }).catch(function () {
                    MessageToFlutter.postMessage('keycloak failed to authenticate');
                });
            }, document.body);
        }
    </script>
</head>
<body onload="initKeycloak()">
    <body>
        <style>
            .spinner {
                width: 100%;
                height: 8px;
                overflow: hidden;
                margin: auto;
            }

            .spinner>div {
                background-color: rgb(0, 0, 0);
                width: 25%;
                height: 100%;
                margin-top: 0;
                margin-left: -25%;
                animation: bounce_loadingProgress 1.5s infinite ease-in-out both;
            }
            @keyframes bounce_loadingProgress {
                0% {
                    margin-left: -25%;
                }
                50% {
                    margin-left: 100%;
                }
            }
            @-webkit-keyframes bounce_loadingProgress {
                0% {
                    margin-left: -25%;
                }
                50% {
                    margin-left: 100%;
                }
            }
        </style>
        <div class="spinner">
            <div class="line1"></div>
        </div>
    </body>
</html>''';
}
