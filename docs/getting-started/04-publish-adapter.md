# Publishing your adapter
## one time to do for the release/publishing
### ioBroker developer portal
go to https://www.iobroker.dev/adapter-check

Check your adapter by giving your adapter git repository. This will check a lot of important standarts. The following could be ignored:

[E200] "Not found on npm. Please publish" 

[W400] "Cannot find "your adapter" in latest repository

because we have not published. Have a look to all other errors and warnings.

Good resources for solving such errors and warnings could be found at https://github.com/ioBroker/ioBroker.repositories#development-and-coding-best-practices and https://github.com/ioBroker/ioBroker.repositories/blob/master/REVIEW_CHECKLIST.md. 

<!-- ToDo: include the two links into this documents. -->

### npm

Log in to https://www.npmjs.com/ (best with your github account)

Create access token for publish. These tokens may need to be regenerated and exchanged, when you ever has changed your account settings. Especialy when you changed your login method or security level(e.g. 2FA). When you already have 2FA enabled, then you need to generate a token with the type Automation. Type Publish will not working with github.

### github repository from your adapter

Add the npm token in Settings/Secrets/Actions New repository secrets

Name NPM_TOKEN

Value abcdef01234567890abcdef01234567890

Check in Settings/Actions/General if the workflowpermissions is set to "read and write permissions". Don't forget to save.

### content of .github/workflows/test-and-release.yml in your repository

Go to #TODO: To enable automatic npm release ...

Uncomment the block and remove the TODO

Decide if you will use Sentry. If not delete all lines with sentry at the beginning. When you like to use the ioBroker Sentry, left it commented out until your adapter is reviewed and in the beta review repository. You need to add the token for Sentry in the same way as for npm, but with

Name SETRY_AUTH_TOKEN

Value 01234567890abcdef01234567890abcdef

Commit the adapter content to github. (Actually the script is only working when your main is not protected or you at least able to push directly to your main)

### optionally modify the package.json

In the section scripts there is the line

``` "release": "release-script" ```

This is doing the magic, if you do

``` npm run release ```

inside the root folder of your repository. This is at the beginning enought, but there are two more release types needed later

```
npm run release patch
npm run release minor
npm run release major
```

When what? When you have small changes, like bugfixes without new interfaces, use ```npm run release``` or more precise ```npm run release patch```. When you have fully backward compatible changes, like bugfixes, new functions without deleting old functions or just overloaded functions, use ```npm run release minor```. When you have major changes and when you have at least deleted one function, so you have no backward compatibility and the user need to react on your change, use ```npm run release major```.

## todo for every release/publishing

Check if in the readme at the change log section the

``` ### **WORK IN PROGRESS** ```

line is copied from the Placeholder. Check your last commits, if all changes are well described in the Changelog.
Commit the adapter content to github. If you have uncommitted changes. Otherwise the release script will fail. 

Now do:

``` npm run release patch```

Thats it.

# Trouble shooting

* Error 504 during translation: The translation of longer text snipets fail sometimes. Shorten the text and retry.
* Also be sure that all is committed. There are often uncommited changes. But the error message is clear here.
* best practice: commit the latest status and push to github and check that testing works BEFORE creating a new version (else you need to revert a lot of stuff (especially io-package!) because the version then never went out.
* Check your emails/github actions page to see if the release was successfull
