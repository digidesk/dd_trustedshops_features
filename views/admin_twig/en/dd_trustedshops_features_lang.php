<?php
/**
 *
 *     |o     o    |          |
 * ,---|.,---..,---|,---.,---.|__/
 * |   |||   |||   ||---'`---.|  \
 * `---'``---|``---'`---'`---'`   `
 *       `---'    [media solutions]
 *
 * @copyright   (c) digidesk - media solutions
 * @link            http://www.digidesk.de
 * @author          digidesk - media solutions
 * @license         https://raw.githubusercontent.com/digidesk/dd_trustedshops_features/master/20210812_TS-licence_Oxid_EN_v1.1.txt
 */

$sLangName = 'English';

$aLang = [
    // Charset
    'charset'                                        => 'UTF-8',

    // Lang-Strings
    'TrustedShops'                                   => 'Trusted Shops Reviews Toolkit',
    'CLOSE'                                          => 'Close',
    'SAVE'                                           => 'Save',
    'DD_TRUSTEDSHOPS_FEATURES_ID_INFO'               => 'The Trusted Shops ID is a unique identifier for your shop. You can find your Trusted Shops ID in your confirmation email after signing up. ',
    'DD_TRUSTED_SHOPS_INTEGRATION'                   => 'Trusted Shops Reviews Toolkit',
    'DD_TRUSTED_SHOPS_INTEGRATION_SETTINGS'          => 'Settings',
    'DD_TRUSTEDSHOPS_FEATURES_MODAL_LOADING'         => 'Loading...',
    'DD_TRUSTEDSHOPS_FEATURES_REGISTER'              => 'Sign up here',
    'DD_TRUSTEDSHOPS_FEATURES_REGISTER_INFO_PICTURE' => 'Infografik_en.png',

    // Tabs
    'DD_TRUSTEDSHOPS_FEATURES_TAB_STANDARD'          => 'Standard',
    'DD_TRUSTEDSHOPS_FEATURES_TAB_EXPERT'            => 'Expert',

    // Errors
    'DD_TRUSTEDSHOPS_FEATURES_ERRORS_EMPTY_TSID'     => 'Please enter your Trusted Shops ID.',

    // Alerts
    'DD_TRUSTEDSHOPS_FEATURES_ALERTS_SAVE_SUCCESS'   => 'Settings saved.',
    'DD_TRUSTEDSHOPS_FEATURES_ALERTS_NOTSIDS'        => 'There are currently no Trusted Shops IDs configured. Please click on "Trusted Shops IDs" above and configure a Trusted Shops ID.',
    'DD_TRUSTEDSHOPS_FEATURES_ALERTS_NOLANGUAGES'    => 'There are currently no languages configured in your shop. Please configure a language in the general settings at first.',

    // ID-Switcher
    'DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_BUTTON'    => 'Trusted Shops IDs',
    'DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_ADD_NEW'   => 'Add a Trusted Shops ID',
    'DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_EDIT'      => 'Edit',
    'DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_DELETE'    => 'Delete',

    'DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TITLE'                             => 'Create/Edit Trusted Shops ID',
    'DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TSID'                              => 'Trusted Shops ID',
    'DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_LANGUAGE'                          => 'Sprache',

    // Standard-View
    'DD_TRUSTEDSHOPS_FEATURES_TRUSTBADGE_TITLE'                                    => 'Configure the Trustbadge for your shop',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_TRUSTBADGE_PREVIEW'                         => 'Preview of your Trustbadge',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_LABEL'                              => 'Trustbadge variants:',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_1'                                  => 'Display Trustbadge with review stars',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_2'                                  => 'Display Trustbadge without review stars',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_POSITION_LABEL'                             => 'Trustbadge position',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_POSITION_1'                                 => 'top right',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_POSITION_2'                                 => 'bottom right',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_POSITION_3'                                 => 'top left',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_POSITION_4'                                 => 'bottom left',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_OFFSET'                                     => 'Y-Offset',
    'DD_TRUSTEDSHOPS_FEATURES_STANDARD_TOP_OFFSET_INFO'                            => 'Adjust the y-axis position of your Trustbadge vertically from the lower right corner of your shop.',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_TITLE'                              => 'Configure additional products',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER'                     => 'Activate Review Sticker',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_0'                   => 'deactivate',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_1'                   => 'Comment Sticker',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_2'                   => 'Review Sticker',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION'            => 'Place of integration',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION_0'          => 'Footer (horizontal)',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION_1'          => 'Sidebar (vertical)',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_FONT'                  => 'Font',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_REVIEWS'               => 'Number of reviews',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_BETTER_THAN'           => 'Minimum rating',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_BG'                    => 'Background Colour',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_TITLE'         => 'Activate Google Richt Snippets',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_DOCS_LINK'     => 'Google Rich Snippets documentation',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_INFO'          => 'If you activate this option, Rich Snippets will be integrated to the selected pages so that your stars may be visible in Google organic search.
If you have already activated shop reviews or product reviews on an additional tab using the standard mode, rich snippets are already implemented within your shop. We highly recommend, to disable them on the category or product detail page in this case or to deactivate rich snippets within the stickers using the expert mode.',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_CATEGORY_PAGE' => 'Category listings',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_DETAILS_PAGE'  => 'Details pages',
    'DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_HOME_PAGE'     => 'Home page <small>(not recommended)</small>',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_TITLE'                               => 'Configure Product Reviews for your shop',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT'                             => 'Collect Product Reviews',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_MODAL'                   => 'More Traffic, fewer returns: Make sure to unlock  Product Reviews in your Trusted Shops plan. Please log into your <a href="https://www.trustedshops.com/en/shop/login.html">MyTS-Account</a> and got to the Upgrade centre (More>>Upgrade centre).',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_MODAL_CONFIRM'           => 'Confirm',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB'             => 'Show Product Reviews on the Product Detail page on an additional section.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME'        => 'Name of Product Reviews section',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME_INFO'   => 'Please choose a name for the section in which the Product Reviews shall be displayed.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_BORDER'      => 'Border Colour',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_COLOR_STARS' => 'Star Colour',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_COLOR_BG'    => 'Background Colour',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_HIDE_EMPTY'  => 'Hide empty Review Sticker',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_HIDE_EMPTY_INFO' => 'Hide Product Reviews until the product has received its? first review; otherwise an information will be displayed.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS'               => 'Show Star ratings on the Product Detail Page',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_UNDER_NAME'    => 'Show Star ratings on the Product Detail Page below your Product Name.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_SIZE'          => 'Star Size',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_SIZE_FONT'     => 'Font Size',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_EMPTY'         => 'Hide empty Star Ratings',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_EMPTY_INFO'    => 'Hide Star Ratings until the product has received its? first review; otherwise a grey placeholder will be displayed',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_LABEL'                               => 'Activate Product Sticker',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_ACTIVATE'                            => 'Activate',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_DEACTIVATE'                                        => 'Deactivate',

    // Expert-View
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_1'                                                => 'Use additional options to customize your Trusted Shops Integration or use the latest code version here. E.g.:<br><br> 
<ul><li>Place your Trustbadge wherever you want</li><li>Deactivate mobile use</li><li>Jump from your Product Reviews stars directly to your Product Reviews</li></ul><br>
Learn more about <a href="http://www.trustedshops.co.uk/support/trustbadge/trustbadge-custom/">Trustbadge</a> options and <a href="http://www.trustedshops.co.uk/support/product-reviews/">Product Reviews</a><br> configuration or',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_2'                                                => 'test',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_2_URL'                                            => 'https://www.trustedshops.com/reviewsticker/preview',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_3'                                                => 'your configuration options and copy your code directly.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_EXPERT'        => 'jQuerySelector',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_INFO_EXPERT'   => 'Please choose where your Product Reviews shall be displayed on the Product detail page.',
    'DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_JQUERY_SELECTOR_INFO_EXPERT' => 'Please choose where your Product Review Stars shall be displayed on the Product Detail page',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_TRUSTBADGE_CODE_LABEL'                                      => 'You\'ll find a step-by-step instruction for your shopsoftware in our integration center.',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_TRUSTBADGE_CODE_LABEL_LINK_1'                               => 'Click',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_TRUSTBADGE_CODE_LABEL_LINK_2'                               => 'here',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_TRUSTBADGE_CODE_LABEL_LINK_3'                               => '.',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER'                                       => 'Paste custom code here...',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_REVIEW_STICKER_CODE_LABEL'                                  => 'Edit Review Sticker code',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_PRODUCT_STICKER_CODE_LABEL'                                 => 'Edit Product Sticker code',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_PRODUCT_STICKER_CODE_HELP'                                  => 'In order that the SKU is dynamically inserted into the code, please set the variable "%sku%" to the correct place in the code.',
    'DD_TRUSTEDSHOPS_FEATURES_EXPERT_CONFIGURE_ADDITIONAL_OPTIONS'                               => 'Configure additional options',
    'DD_TRUSTEDSHOPS_FEATURES_REVIEWS_JQUERY_SELECTOR_INFO_EXPERT'                               => 'Please choose where your Shop Reviews shall be displayed in your Shop',
];