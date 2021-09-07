module.exports = {
    options: {
        compress: true,
        yuicompress: true,
        optimization: 2
    },
    default: {
        files: {
            "modules/digidesk/dd_trustedshops_features/out/src/css/backend.min.css":  [
                "build/vendor/minicolors/css/jquery.minicolors.css",
                "build/less/backend.less"
            ],
            "modules/digidesk/dd_trustedshops_features/out/src/css/frontend.min.css": "build/less/frontend.less"
        }
    }
};