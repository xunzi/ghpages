---
title: "Pleroma: Remove Rum Index"
date: 2023-04-11
tags: ['pleroma', 'postgres']
slug: pleroma-remove-rum-index
---

When setting up pleroma for my activity-pub instance I was a bit over-zealous and selected the option "Enable RUM index" without knowing what it means.

As this is a single user instance using RUM indices is really not neccessary, also I found out that they are quite heavy in disk usage, blowing up the db by several GB. I also found out that creating these indices takes a very long time when I upgraded to a newer PostgreSQL version and had to import the dump file. Creation of the indices took approximately two hours on a small Hetzner cloud instance.

As for documentation I only found the opposite process described (enabling RUM indices) so I thought I might note down the steps to disable them.

The documentation for Akkoma suggests that this procedure should also work there but I did not test it myself.


## Stop Nginx
```shell
root@social:/etc/pleroma# systemctl stop nginx
```

## Verify Your DB backup

You do have a backup process in place, right? I suggest using [pgbackrest](https://pgbackrest.org/) which is easy to set up and monitor.

## Run Migration To Disable RUM

```shell
root@social:/etc/pleroma# su pleroma -s $SHELL -lc "./bin/pleroma_ctl  rollback --migrations-path priv/repo/optional_migrations/rum_indexing"
```

This will drop the RUM indices and triggers and create the standard GIN indices.

## Switch the RUM Index Setting

```erlang
config :pleroma, :database, rum_enabled: false
```

## Restart pleroma

```shell
root@social:/etc/pleroma# systemctl restart pleroma.service
```

## Start nginx

```shell
root@social:/etc/pleroma# systemctl start nginx
```

## Remove RUM Extension

```plsql
postgres@pleroma # DROP EXTENSION rum ;
```

## (Optionally) Remove RUM Extension Package

```shell
root@social:/etc/pleroma# apt remove postgresql-14-rum
```

This depends on your choice of OS and PostgreSQL deployment, this command is for the PostgreSQL version that is included in Ubuntu Jammy.
