# Notifications domain

Owns message templates, locale variants, recipient preferences, delivery attempts, provider references, retries, suppression and delivery evidence. It does not own the business event, approval, legal notice service or transaction acceptance. Domain events originate from their authoritative contexts; adapters live under `integrations/`.