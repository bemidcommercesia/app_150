import 'package:flutter/material.dart';

import '../../../../general/presentation/widgets_ns2kd7py/dark_nav_screen_ns2kd7py.dart';
import '../../../../general/presentation/widgets_ns2kd7py/info_section_ns2kd7py.dart';

class TermsConditionsNs2kd7pyScreen extends StatelessWidget {
  const TermsConditionsNs2kd7pyScreen({super.key});

  static const _sections = [
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: 'Loan Products and Cost Disclosure',
      body:
          'Loan products from independent third-party providers generally feature repayment terms ranging from a minimum of 65 days up to a maximum of 2 years. The Annual Percentage Rate (APR), which represents the yearly cost of the credit including interest and applicable charges, for smaller loans typically falls between 5.99% and 35.99%.\n\nIt is important to note that Borrow Money & Instant Loan does not impose any charge on users for submitting a request via the App. All loan conditions, such as the APR, associated fees, repayment schedules, approval results, and funding decisions, are determined exclusively by the relevant third-party provider. This determination is based on your specific financial profile, the loan amount you request, and the relevant legal requirements.\n\nAn illustrative example of estimated payment presentation is shown below:\n\nIllustrative Loan Example\nThis demonstrates the total expense of a loan, including all related charges:\nPrincipal Amount: \$900\nDuration of Loan: 3 months\nAPR: 30%\nMonthly Payment: \$324.90\nOverall Repayable Amount: \$974.70\nTotal Interest Paid: \$74.70',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '1. Eligibility Requirements',
      body:
          'To access and utilize this App, you must be at least eighteen (18) years of age and possess the legal capacity to enter into a binding agreement under applicable law. By using or accessing the App, you affirm and guarantee that you meet these eligibility criteria.\n\nThe App is designated for use by individuals located within the United States. It is not targeted at minors under 18 years old, and we do not knowingly permit access to anyone who fails to satisfy the eligibility standards outlined in these Terms.',
    ),
    (
      icon: 'assets/images/svg/ic_section_share.svg',
      title: '2. Our Function',
      body:
          'Borrow Money & Instant Loan operates solely as a digital intermediary. We are not a credit provider, do not grant credit, do not issue loan offers, and are not involved in decisions concerning credit approval, interest rates, fees, repayment plans, or any other loan terms. The App\'s function is purely to allow users to submit information for transmission to independent third-party lending partners or financial service providers for their potential review.\n\nAny agreement you finalize for a loan or other financial product is strictly between you and the respective third-party provider. BEMID COMMERCE SIA is not a party to such agreements and assumes no responsibility for the terms, disclosures, approval outcomes, servicing, collection activities, or performance of any financial product offered by a third party.\n\nUsing the App does not guarantee that you will receive a loan offer, meet the qualifications for a loan, or be matched with any particular provider.',
    ),
    (
      icon: 'assets/images/svg/ic_section_security.svg',
      title: '3. User Obligations',
      body:
          'By utilizing the App, you commit to the following:\n\nSupplying information that is truthful, accurate, up-to-date, and complete.\nRestricting use of the App to lawful and personal purposes only.\nRefraining from submitting information belonging to another individual without proper authorization or consent.\nNot engaging in identity misrepresentation or impersonation.\nAvoiding interference with, disruption of, damage to, or attempts to gain unauthorized access to the App, its underlying systems, or associated networks.\nNot using the App in a manner that violates applicable laws, regulations, platform policies, or the rights of any third party.\n\nYou acknowledge that inaccurate, incomplete, or deceptive information may influence a third-party provider\'s decision regarding the review of your request.',
    ),
    (
      icon: 'assets/images/svg/ic_section_payments.svg',
      title: '4. Intellectual Property Rights',
      body:
          'All text, graphics, software, layouts, design components, trademarks, logos, service marks, trade names, and other content and materials available within the App are the proprietary assets of BEMID COMMERCE SIA or its licensors and are safeguarded by relevant intellectual property laws in the United States and other applicable jurisdictions.\n\nExcluding the limited authorization to use the App for its designated personal purpose, these Terms do not confer upon you any ownership rights or other interests in the App or its content. You are prohibited from reproducing, modifying, distributing, displaying, republishing, reverse engineering, creating derivative works from, or otherwise exploiting any segment of the App without the prior written consent of BEMID COMMERCE SIA, except where explicitly allowed by applicable law.',
    ),
    (
      icon: 'assets/images/svg/ic_section_cookies.svg',
      title: '5. Services from Third Parties',
      body:
          'The App may contain links to, integrate with, or transmit data to external third-party providers, websites, tools, or services. These third parties operate independently of BEMID COMMERCE SIA, and we neither control nor accept responsibility for their content, availability, conditions, privacy practices, decisions, disclosures, or services.\n\nBefore engaging with any external provider, you must thoroughly review that provider\'s own terms of service, privacy notice, and disclosures. All interactions, agreements, or transactions between you and a third-party provider are solely the responsibility of you and that provider.',
    ),
    (
      icon: 'assets/images/svg/ic_section_liability.svg',
      title: '6. App Marketplace and Platform Compliance',
      body:
          'The App may be distributed through external app marketplaces or function on devices and platforms maintained by third parties. Your usage of the App must adhere not only to these Terms but also to any relevant terms, rules, and technical requirements established by the corresponding app marketplace, device provider, operating system provider, or wireless carrier.\n\nUnless mandated otherwise by applicable law, third-party platform providers, including app marketplace operators, are not responsible for the App\'s content, functionality, maintenance, support, or loan-related disclosures. These entities are not lenders, do not make lending decisions through the App, and are not parties to these Terms.\n\nWe maintain the right to update, limit, suspend, or modify the App\'s content, features, disclosures, or availability at any time when reasonably necessary to ensure legal compliance, platform conformity, fraud prevention, operational security, user safety, or system integrity.',
    ),
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: '7. Privacy and Data Handling',
      body:
          'Your use of the App is also governed by our Privacy Policy, which details how information may be gathered, utilized, disclosed, and protected. By using the App, you acknowledge that the information you submit may be processed and shared with participating third-party providers for the purpose of assessing and responding to your request.\n\nWe endeavor to handle information in a manner consistent with applicable United States laws and regulations. However, each third-party provider that receives information via the App is independently accountable for its own privacy, data management, underwriting, servicing, and legal compliance procedures.\n\nNo electronic transmission or storage method is entirely risk-free. Consequently, while we implement reasonable measures to safeguard information, we cannot guarantee absolute security.',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '8. Disclaimers and Exclusions',
      body:
          'The App provides no assurances, representations, or guarantees concerning:\n\nWhether you will be approved for a loan or other financial product.\nWhether you will receive any offer from a third-party provider.\nThe specific amount of any potential loan offer.\nThe APR, fees, repayment period, or other terms of any offer.\nThe timeline for any decision or funding outcome.\n\nThe App is furnished on an "as is" and "as available" basis, to the fullest extent legally permissible. To the maximum extent allowed by applicable law, BEMID COMMERCE SIA disclaims all warranties, whether explicitly stated, implied, or statutory, including any implied warranties of merchantability, fitness for a specific purpose, title, non-infringement, accuracy, availability, or uninterrupted service.\n\nWe do not guarantee that the App will always be accessible, free of errors, uninterrupted, secure, or compatible with every device, network, or platform.',
    ),
    (
      icon: 'assets/images/svg/ic_section_share.svg',
      title: '9. Limitation on Liability',
      body:
          'To the maximum extent permitted by applicable law, BEMID COMMERCE SIA, its related entities, executives, directors, employees, contractors, licensors, and service providers shall not be held liable for any indirect, incidental, consequential, special, exemplary, or punitive damages resulting from or related to your inability to use, or use of, the App or any integrated or linked third-party service.\n\nThis limitation encompasses, but is not restricted to, damages for lost profits, lost data, business disruption, loss of reputation, financial loss, or other intangible losses, even if the possibility of such damages was advised.\n\nShould BEMID COMMERCE SIA be found liable for any claim arising from or related to the App, despite the preceding limitation, then, to the fullest extent permitted by law, our total aggregate liability will not exceed the greater of: (a) the total amount you paid, if any, for using the App during the six (6) months prior to the event giving rise to the claim, or (b) one hundred U.S. dollars (US \$100).\n\nThese Terms do not exclude or limit liability for matters that cannot be excluded or limited under applicable law.',
    ),
    (
      icon: 'assets/images/svg/ic_section_security.svg',
      title: '10. Resolution of Disputes',
      body:
          'We aim for a swift and equitable resolution of any issues. Before initiating any formal legal action, you agree to first contact us at contact@bemidcommercesia.com and provide a brief written summary of your concern, affording us an opportunity to attempt an informal resolution.\n\nIf a dispute cannot be resolved informally within thirty (30) days, then either party has the option to pursue the matter in small claims court, if eligible, or through individual arbitration, instead of standard court proceedings, unless prohibited by applicable law. This section does not preclude either party from seeking temporary injunctive or equitable relief from a court when reasonably necessary to protect intellectual property, confidential information, account security, or the integrity of the App.\n\nWhere arbitration is applicable, it will be administered under the relevant consumer arbitration rules in a reasonably convenient venue or through remote means when permissible. You and BEMID COMMERCE SIA each waive, to the extent permitted by law, any right to a jury trial for claims resolved through arbitration.\n\nIf any segment of this section is determined to be unenforceable, the remaining provisions will continue in full effect to the maximum extent permitted by law.',
    ),
    (
      icon: 'assets/images/svg/ic_section_payments.svg',
      title: '11. Suspension or Termination',
      body:
          'We retain the right to suspend, restrict, or terminate your access to the App at any time, with or without prior notice, if we reasonably believe that:\n\nYou have violated these Terms.\nYou have supplied false or misleading information.\nYour use of the App creates legal, security, technical, or operational risks.\nSuspension or termination is necessary to adhere to law, regulation, platform rules, or a lawful request.\n\nThe termination or suspension of access does not negate any rights or obligations that, by their intrinsic nature, should survive termination.',
    ),
    (
      icon: 'assets/images/svg/ic_section_cookies.svg',
      title: '12. Governing Jurisdiction',
      body:
          'These Terms shall be interpreted and governed in accordance with applicable federal law and the laws of the State of Georgia, disregarding its conflict-of-law principles, except where mandatory consumer protection laws require otherwise.',
    ),
    (
      icon: 'assets/images/svg/ic_section_liability.svg',
      title: '13. Amendments to These Terms',
      body:
          'We may revise these Terms periodically to account for modifications in the App, applicable legislation, compliance demands, security protocols, third-party integrations, or business operations. In the event of substantive changes, we may notify users through the App, via email, or by other appropriate and reasonable methods.\n\nYour continued utilization of the App after the revised Terms take effect signifies your acceptance of the updated Terms. If you disagree with the revised Terms, you must cease using the App.',
    ),
    (
      icon: 'assets/images/svg/ic_section_info.svg',
      title: '14. Contact Information',
      body:
          'For questions, concerns, or formal notices regarding these Terms, you may reach us at:\n\nBEMID COMMERCE SIA\nEmail: contact@bemidcommercesia.com',
    ),
    (
      icon: 'assets/images/svg/ic_section_usage.svg',
      title: '15. Entirety of Agreement',
      body:
          'These Terms, in conjunction with the Privacy Policy and any other legally required disclosures or notices provided within the App, constitute the complete and exclusive agreement between you and BEMID COMMERCE SIA regarding your use of the App and supersede all prior or simultaneous understandings, communications, or agreements pertaining to the same subject matter.\n\nShould any provision of these Terms be deemed unlawful, invalid, or unenforceable, the remaining provisions will remain in full force and effect.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DarkNavScreenNs2kd7py(
      title: 'Terms of Use',
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
