#!/usr/bin/env bash

prefs_file="$XDG_CONFIG_HOME/mozilla/firefox/$USER/prefs.js"

preferencias=( \
  # Compact UI
  'user_pref("browser.uidensity", 1);' \
  # Warm on close off
  'user_pref("browser.tabs.warnOnClose", false);' \
  # CSS customizations
  'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' \
  # Search Engine
  'user_pref("browser.urlbar.placeholderName", "DuckDuckGo");' \
  # Privacy
  'user_pref("privacy.donottrackheader.enabled", true);' \
  # Remembering...
  'user_pref("signon.autofillForms", false);' \
  'user_pref("signon.generation.enabled", false);' \
  'user_pref("signon.management.page.breach-alerts.enabled", false);' \
  'user_pref("signon.rememberSignons", false);' \
  # Restore session
  'user_pref("browser.startup.page", 3);' \
  # Theme
  'user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");' \
  # Old url bar
  'user_pref("browser.urlbar.update1", false);' \
  'user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);' \
  'user_pref("services.sync.prefs.sync.app.shield.optoutstudies.enabled", false);' \
  'user_pref("app.shield.optoutstudies.enabled", false);' \
)

for str in "${preferencias[@]}"; do
  to_del=$(echo $str | cut -f1 -d",")
  sed -i '/'${to_del}'.*/d' $prefs_file
  grep -q '$str' $prefs_file || echo "$str" >> $prefs_file
done

