module.exports = {
    options: {
        compress: true,
        yuicompress: true,
        optimization: 2
    },
    default: {
        files: {
            "assets/css/backend.min.css":  [
                "build/vendor/minicolors/css/jquery.minicolors.css",
                "build/less/backend.less"
            ],
            "assets/css/frontend.min.css": "build/less/frontend.less"
        }
    }
};