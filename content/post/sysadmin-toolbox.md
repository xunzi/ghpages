---
title: "Sysadmin Toolbox"
layout: post
date: 2020-11-14T16:03:17+01:00
draft: true
tags: [ 'sysadmin', 'tools of the trade' ]
slug: "sysadmin-toolbox"
---
This is the first in a series of blog entries describing things that are useful for running a tidy ship as a systems administrator. The selection of tools does not claim to be comprehensive and is driven by my professional experience and personal preferences.

Today's topic directory services is probably moot in most medium to large organisations, the overwhelming majority of these should be Active Directory installations.

If there is already a directory in your org you should definitely use it to reap the following benefits:

### Password Consistency
If you can use your directory account to sign on to all applications you will only have to remember one (hopefully well chosen and complex) password.

This password's complexity and lifetime requirements can also be enforced by the directory making for a more secure environment that easier to audit.

### Access based on your Orgs Structure
A directory should mirror your organizations structure, enabling you to grant access to applications based on group membership and giving you a single point of control for access permissions to resources.
