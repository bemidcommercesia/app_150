import 'package:flutter/material.dart';

import '../../../../general/presentation/widgets_ns2kd7py/dark_nav_screen_ns2kd7py.dart';
import '../../../../general/presentation/widgets_ns2kd7py/info_section_ns2kd7py.dart';

class DataProtectionNs2kd7pyScreen extends StatelessWidget {
  const DataProtectionNs2kd7pyScreen({super.key});

  static const _sections = [
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: 'Introduction',
      body:
          'At BEMID COMMERCE SIA, your privacy is paramount. This Privacy Statement outlines how Borrow Money & Instant Loan (referred to as the "Application" or "App") manages, collects, utilizes, and protects information when you access, download, or interact with the Application.\n\nBy engaging with the Application, you confirm that you have reviewed and comprehended this Privacy Statement and agree to the data handling procedures detailed herein.',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '1. Application of This Statement',
      body:
          'This Privacy Statement covers data gathered directly through the Application and through associated user support channels. It does not extend to third-party services, platforms, websites, or applications, even if they are connected to, integrated with, or accessible from the Application.\n\nIf you obtain or use the App via an external app store, operating system, or device provider, those third parties may collect or process information independently under their own policies. We are not accountable for the data practices of such third parties.',
    ),
    (
      icon: 'assets/images/svg/ic_section_share.svg',
      title: '2. Data We May Gather',
      body:
          'We may collect the following types of information during your use of the App:\n\nIdentifying Details\nWe may collect personal information you knowingly provide to us, such as:\nfull name;\nemail address;\ntelephone number;\ndetails shared when contacting our support team or engaging in communication with us.\n\nTechnical and Activity Data\nWe automatically gather certain technical and interaction-related information, including:\nmodel and type of your device;\noperating system and its version;\nApplication version;\nInternet Protocol (IP) address;\nselected language settings;\ngeneral geographical area derived from IP address or device settings, if available;\nmobile network specifics;\nunique device identifiers and related technical codes.\n\nIn-App Usage Metrics\nWe track how you engage with the Application, for instance:\nscreens viewed within the App;\ninteractive elements (buttons, links) selected;\nduration of usage sessions;\ntime spent on particular functions;\nmovement patterns within the App;\nbroad interaction events.\n\nCustomization and Alert Data\nIf the App includes personalization, notifications, or alert features, we may store your preferences concerning:\nconfiguration for push notifications;\nsettings for in-app reminders;\npersonalized feature choices;\ngeneral in-app preferences.\n\nPerformance, Diagnostics, and Failure Reports\nFor monitoring and optimization purposes, we collect data about:\napplication failures (crashes);\ndetails of reported errors;\ndebugging diagnostics;\nmetrics related to system performance;\nlogs used for troubleshooting.',
    ),
    (
      icon: 'assets/images/svg/ic_section_security.svg',
      title: '3. Utilization of Collected Data',
      body:
          'We utilize the gathered information for the following specific purposes:\n\nTo Run and Maintain the Service\nWe use data to ensure the essential operation of the App, keep all functions working, resolve technical problems, and maintain the security and operational stability of the service.\n\nTo Communicate With Users\nYour contact details may be used to send necessary service announcements, reply to your inquiries, provide technical support, distribute critical notifications, or share updates related to the App.\n\nTo Enhance Functionality and Performance\nWe analyze data on usage patterns, application events, diagnostics, and performance to better understand how the App is used, improve features, resolve software defects, and elevate the overall user experience.\n\nTo Tailor the User Journey\nWhere feasible, we utilize activity and preference data to customize alerts, content, or the in-app environment to make the App more useful and personalized for you.\n\nTo Ensure Safety and Integrity\nInformation is used to detect, prevent, or investigate misuse, fraud, security vulnerabilities, suspicious behavior, or any conduct that breaches our terms or legal obligations.\n\nTo Fulfill Legal Requirements\nWe process information as necessary to adhere to relevant laws, regulatory directives, official governmental requests, legal orders, or other mandatory legal procedures.',
    ),
    (
      icon: 'assets/images/svg/ic_section_rights.svg',
      title: '4. Instances Where Data May Be Shared',
      body:
          'We will never sell your personally identifiable information.\n\nWe may disclose data only under the following conditions:\n\nWith Trusted Service Providers\nWe may share data with external vendors, contractors, analytics firms, cloud hosting services, technical support tool providers, crash-reporting companies, and similar entities who assist us in the operation, security, maintenance, and improvement of the App. These parties are restricted to processing information solely for our defined business needs and are subject to confidentiality obligations.\n\nFor Compliance, Security, and Legal Mandates\nDisclosure may occur if we genuinely believe it is necessary to:\ncomply with mandatory legal requirements or processes;\nrespond appropriately to legitimate requests from governmental or public authorities;\nprotect our rights, assets, privacy, safety, or that of our users;\ninvestigate incidents of fraud, security breaches, or abuse;\nenforce our internal policies or agreements.\n\nIn the Context of Business Transfers\nIn the event that our business, the App, or related assets are involved in a sale, merger, reorganization, acquisition, bankruptcy, financing, or transfer, information may be disclosed as part of that corporate event, in compliance with applicable law.\n\nUpon Your Instruction or Approval\nWe may share data when you explicitly request, consent to, or otherwise authorize us to do so.',
    ),
    (
      icon: 'assets/images/svg/ic_section_cookies.svg',
      title: '5. Tracking Technologies',
      body:
          'The Application may incorporate cookies or related technologies, such as Software Development Kits (SDKs), local storage features, unique device identifiers, log files, and analytical tools. These are used to gain insights into usage, save preferences, enhance performance, and facilitate App functions.\n\nYou might be able to manage certain settings related to permissions, identifiers, notifications, or tracking through your device or platform configuration menus. Be aware that disabling certain permissions or settings may cause some features of the App to malfunction.',
    ),
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: '6. Our Commitment to Data Security',
      body:
          'We employ appropriate administrative, physical, and technical safeguards designed to protect personal information against unauthorized disclosure, alteration, loss, misuse, or access.\n\nHowever, no transmission or storage method is infallible. Although we strive for the highest protection, we cannot guarantee absolute security of your information.',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '7. Data Retention Policy',
      body:
          'We retain information for the duration required to reasonably fulfill the purposes outlined in this Privacy Statement, including delivering the App service, maintaining necessary business records, resolving legal disputes, enforcing contracts, fulfilling legal obligations, and supporting essential business functions.\n\nThe period of retention can vary based on the nature of the data, its original purpose of collection, relevant legal constraints, and ongoing operational necessities.',
    ),
    (
      icon: 'assets/images/svg/ic_section_share.svg',
      title: '8. Your Options and Privacy Rights',
      body:
          'Based on your location and subject to legal frameworks, you may possess specific rights regarding your personal information. These may include the authority to:\nrequest details about the personal information we hold about you;\nseek correction of any inaccurate personal information;\nrequest the deletion of certain personal data;\nrequest clarity on how your personal data is utilized or shared;\nopt out of specific data sharing or marketing activities, where such rights are recognized;\nrevoke permissions or consents previously granted, if applicable.\n\nYou can also often manage certain App functions, including notification settings and various permissions, directly via your device settings.\n\nTo exercise any applicable privacy rights, please use the contact details provided in the "How to Reach Us" section below. We may need to verify your identity before processing certain requests. In some circumstances, we reserve the right to decline or limit a request as permitted by law.',
    ),
    (
      icon: 'assets/images/svg/ic_section_security.svg',
      title: '9. External Links and Third-Party Services',
      body:
          'The App may contain links to or facilitate interaction with external services, websites, or tools. These third parties operate independently and are governed by their own terms, policies, and data handling practices.\n\nWe assume no responsibility for the content, security, privacy practices, or operations of any third-party services. We strongly advise you to review their privacy statements before providing personal data or utilizing their services.',
    ),
    (
      icon: 'assets/images/svg/ic_section_rights.svg',
      title: '10. Protection of Children\'s Data',
      body:
          'The App is intended for users who are at least 18 years of age. We do not knowingly gather personal information from children under the age of 18 through the Application.\n\nIf you suspect that a minor has submitted personal information via the App, please contact us immediately. Should we discover that we have collected information from a child in violation of law, we will promptly delete that data as required.',
    ),
    (
      icon: 'assets/images/svg/ic_section_cookies.svg',
      title: '11. Notice Regarding Platforms and Marketplaces',
      body:
          'If you downloaded the App from a third-party app marketplace or use it on a specific device operating system or platform, those providers may impose their own technical and regulatory demands concerning permissions, data handling, device identifiers, notifications, or privacy.\n\nUnless mandated otherwise by law, these platform providers are not responsible for our privacy practices. This Privacy Statement is solely applicable to data collected by or on behalf of BEMID COMMERCE SIA through the Application.\n\nWe reserve the right to update in-app notices, data disclosures, permissions language, or data processing methods when reasonably necessary to ensure compliance with legal obligations, platform rules, security standards, fraud prevention, and operational integrity. Major platform providers like Apple and Google require developers to clearly articulate app data practices in listing materials and privacy disclosures.',
    ),
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: '12. Amendments to This Statement',
      body:
          'We may periodically revise this Privacy Statement to accommodate changes in the App, our business operations, legal requirements, or platform mandates. When we implement updates, we will change the "Effective Date" noted at the top and may also notify you within the App or through other appropriate channels if required by law.\n\nYour continued use of the Application after the revised Privacy Statement takes effect signifies your acceptance of the updated terms.',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '13. How to Reach Us',
      body:
          'For any inquiries, concerns, or requests related to this Privacy Statement or our data practices, please contact us:\n\nBEMID COMMERCE SIA\nEmail: contact@bemidcommercesia.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DarkNavScreenNs2kd7py(
      title: 'Privacy Policy',
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: _sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        itemBuilder: (_, i) => InfoSectionNs2kd7py(
          iconPath: _sections[i].icon,
          title: _sections[i].title,
          body: _sections[i].body,
        ),
      ),
    );
  }
}
