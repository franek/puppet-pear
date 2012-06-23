# Add a define to allow set the proxy
define pear::proxy($proxyEnable = "false", $proxyHost = '', $proxyPort = ''){

    if $proxyEnable == "true" {
        # Set the proxy
        exec {
          "pear-config-proxy":
            command => "pear config-set http_proxy http://${proxyHost}:${proxyPort}";
        }
    } else {
        # Remove proxy setting
        exec {
          "pear-config-proxy":
            command => "pear config-set http_proxy ''";
        }
    }
}
