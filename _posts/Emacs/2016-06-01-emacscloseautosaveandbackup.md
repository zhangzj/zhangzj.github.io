---
layout: post
title: Close emacs auto-save and backup
categories: emacs
description: close auto-save and backup
tags: emacs
---

* content
{:toc}




Emacs will suto save the buffer when editing, there will be other files in working direstory.

Shut down it globally.

```
~/.emacs.d/init.el

;;; close backup files
(setq make-backup-files nil)

;;; close auto-save files
(setq auto-save-default nil)

```

Remember to save files when exit, and take the risk to lose files when crash on computer.