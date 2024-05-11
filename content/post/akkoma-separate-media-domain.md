---
title: Separate Media Domain for Akkoma
date: 2024-05-11
slug: akkoma-sparate-media-domain
tags: [ 'fediadmin', 'activitypub', 'akkoma' ]
---

The last [release](https://akkoma.dev/AkkomaGang/akkoma/releases/tag/v3.13.1) of Akkoma finally enforces setting a base_url value for the uploader (guess who didn't read the release notes before upgrading and had to start digging after the service refused to start).

To enable akkoma to start again I set the base_url value to the main domain of my akkoma instance but this still leaves a rather stern warning to switch to another domain for uplaods (and the media proxy if you use it).

So I created a CNAME for the upload domain and added another nginx server section that basically only serves the uris `/upload`or `/media` and forwards them to phoenix, all other requests will be forwarded to the main domain.

```nginx
[...]
location ~ ^/(media|proxy) {
        proxy_cache        akkoma_media_cache;
        slice              1m;
        proxy_cache_key    $host$uri$is_args$args$slice_range;
        proxy_set_header   Range $slice_range;
        proxy_cache_valid  200 206 301 304 1h;
        proxy_cache_lock   on;
        proxy_ignore_client_abort on;
        proxy_buffering    on;
        chunked_transfer_encoding on;
        proxy_pass         http://phoenixmedia;
    }

    location / {
        return         301 https://$maindomain$request_uri;
    }
```
