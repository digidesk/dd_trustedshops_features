# digidesk Trusted Shops Reviews Toolkit

## Voraussetzung

OXID Shop in der Version CE/PE/EE v7.0.x

## Installation
1. Führen Sie folgende Befehle aus dem Hauptverzeichnis des Shopsystems aus:
   - Produktivsystem:
   ```
   composer require --update-no-dev digidesk/dd_trustedshops_features
   ```
   - Testsystem/Entwicklungssystem:
   ```
   composer require digidesk/dd_trustedshops_features
   ```
2. Nun kann das Modul im OXID eShop Admin aktiviert werden
3. APEX Theme oder das Child-Theme von APEX anpassen, um Produktbewertungen von Trusted Shops auf der Produktdetailseite anzuzeigen
   - Öffnen Sie das Template "tpl/page/details/inc/fullproductinfo.html.twig"
   - Ersetzen Sie den folgenden Block
     ```twig
     {% if oView.isReviewActive() %}
         {% include "widget/reviews/reviews.html.twig" %}
     {% endif %}
     ```
     mit 
     ```twig
     {% block details_productmain_reviews %}
         {% if oView.isReviewActive() %}
             {% include "widget/reviews/reviews.html.twig" %}
         {% endif %}
     {% endblock %}
     ```
4. Tmp-Verzeichnis leeren und Views neu generieren

## Update
1. Führen Sie folgende Befehle aus dem Hauptverzeichnis des Shopsystems aus:
   - Produktivsystem:
   ```
   composer update --no-dev digidesk/dd_trustedshops_features
   ```
   - Testsystem/Entwicklungssystem:
   ```
   composer update digidesk/dd_trustedshops_features
   ```

   Die Frage, ob die Dateien des Pakets überschrieben werden sollen, bestätigen Sie bitte mit "Y".
4. Aktivieren Sie das Modul im OXID eShop Admin
5. Ggf. Tmp-Verzeichnis leeren und Views neu generieren

## Lizenz

[END-USER SOFTWARE LICENSE AGREEMENT FOR TRUSTED SHOPS SOFTWARE](20210812_TS-licence_Oxid_EN_v1.1.txt)