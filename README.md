# Rails Single-Page Example Application With Live Page Content

## Summary

This is a Rails 4.2 template applictaion integrated with the Sync gem for live page content,
and Wiselinks gems for partial view loading for AJAX page navigation.

This is only an example application that hopefully would be useful to developers.

## Usage

* This assumes that you already have a working environment.

* In the directory where you clone this project, run bundle first

  ```bash
  bundle
  ```

* Then, run the rails server:

  ```bash
  rails s
  ````

* On another terminal/window, run the the sync-faye server next.

  ```bash
  rackup sync.ru -E production
  ```

  > Note the `-E production`, Faye server with Thin doesn't seem to work on development

* Finally, open [http://localhost:3000/](http://localhost:3000/) to view the page
