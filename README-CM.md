Before run build on Codemagic:
1. Connect Apple to Codemagic (as usually):
   In CM -> Settings -> Integration -> DeveloperPortal
> Note key name must have name 'cm' or you must change it in codemagic.yaml (app_store_connect)

2. Create Apple Cert In CM
   Settings -> Code signing identities -> iOS Cert -> Generate + Fetch

3. Create ProvisionProfile in Apple Developer
   Certificates, Identifiers & Profiles -> Profiles -> Add.
   App Store Connect -> Select AppID -> Select Certificate -> Enter Name (any)

3.1. Create AdHoc ProvisionProfile in Apple Developer
   Certificates, Identifiers & Profiles -> Profiles -> Add.
   Ad Hoc -> Select AppID -> Select Certificate -> Select Tester (Need to add UDID to AppStoreConnect) -> Enter Name (any)

4. Fetch Provision Profiles in CM:
   Settings -> Code signing identities -> iOS provisioning profiles -> Fetch

5. Add GitHub Webhook in CM:
   Select app -> Settings -> Webhooks -> Update Webhook


Advantages:
- Less bags during codemagic configuration
- No need to setup OS pre-build script
- No need to setup android signing (need testing)
- Support build trigger on tag creation (i-1.2.3+4 - for iOS, a-1.2.3+4 - for android)
- Support build for Tester trigger on tag creation (itest-1.2.3+4 - for iOS)

Disadvantages

- Still need to manually do something: add Apple Cert & Provision profiles (but there is less opportunity to make a bug)
- Need to know Apple Build identifier before using (if using with mason, need to know before project creation or insert later manually)
