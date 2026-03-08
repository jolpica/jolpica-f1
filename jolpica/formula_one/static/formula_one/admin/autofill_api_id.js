/**
 * Auto-fill api_id inputs in dynamically-added admin inline rows.
 *
 * Listens for the `formset:added` event fired by Django admin's JS when the
 * user clicks "+ Add another <Model>" in a TabularInline. Finds any empty
 * input with a `data-api-prefix` attribute (set via formfield_for_dbfield on
 * the inline's ModelAdmin) and populates it with a newly generated API ID
 * of the form `{prefix}_{8 cryptographically random alphanumeric chars}`.
 */
"use strict";

document.addEventListener("formset:added", (event) => {
    const row = event.target;
    const input = row.querySelector("input[data-api-prefix]");
    if (!input || input.value) {
        return;
    }

    const prefix = input.dataset.apiPrefix;
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const randomBytes = new Uint8Array(8);
    crypto.getRandomValues(randomBytes);
    const suffix = Array.from(randomBytes, (b) => chars[b % chars.length]).join("");
    input.value = `${prefix}_${suffix}`;
});
