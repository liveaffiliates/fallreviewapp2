import 'package:flutter/material.dart';

abstract class Strings extends StatelessWidget {

  // Name Page
  static const String personsName = 'personsName';
  static const String personsNameHint = 'Enter name';

  // Description page
  static const String fallDescription = 'fallDescription';
  static const String fallDescriptionHint = 'Enter description';

  static const String timeOnGround = 'timeOnGround';
  static const String timeOnGroundHint = 'Enter time patient on ground (m)';

  // Fracture Check
  static const String pain = 'pain';
  static const String bonyTenderness = 'bonyTenderness';
  static const String painWithMovement = 'painWithMovement';
  static const String limbShortening = 'limbShortening';

  // Vital Signs
  static const String bloodPressure = 'bloodPressure';
  static const String bloodPressureHint = 'Blood Pressure';
  static const String bloodPressureIcon = 'blood-pressure.png';

  static const String heartRate = 'heartRate';
  static const String heartRateHint = 'Heart Rate';
  static const String heartRateIcon = 'heart-rate.png';

  static const String temperature = 'temperature';
  static const String temperatureHint = 'Temperature';
  static const String temperatureIcon = 'temperature.png';

  static const String pupilLeft = 'pupilLeft';
  static const String pupilLeftHint = 'Left Pupil';
  static const String pupilLeftIcon = 'eye.png';

  static const String pupilRight = 'pupilRight';
  static const String pupilRightHint = 'Right Pupil';
  static const String pupilRightIcon = 'eye2.png';

  static const String pupilDescription = 'pupilDescription';
  static const String pupilDescriptionHint = 'Pupil Description';
  static const String pupilDescriptionIcon = 'eye-report.png';

  static const String respiratoryRate = 'respiratoryRate';
  static const String respiratoryRateHint = 'Respiratory Rate';
  static const String respiratoryRateIcon = 'respiratory.png';

  static const String oxygenSaturation = 'Oxygen Saturation';
  static const String oxygenSaturationHint = 'Oxygen Saturation';
  static const String oxygenSaturationIcon = 'oxygen.png';

  static const String bloodGlucose = 'bloodGlucose';
  static const String bloodGlucoseHint = 'Blood Glucose';
  static const String bloodGlucoseIcon = 'blood-glucose.png';

// Injury Check
  static const String unwitnessedFall = 'unwitnessedFall';
  static const String unwitnessedFallTitle = 'Unwitnessed fall';

  static const String hitHead = 'hitHead';
  static const String hitHeadTitle = 'Hit head';

  static const String nausea = 'nausea';
  static const String nauseaTitle = 'Nausea';

  static const String vomiting = 'vomiting';
  static const String vomitingTitle = 'Vomiting';

  static const String severeHeadache = 'severeHeadache';
  static const String severeHeadacheTitle = 'Severe headache';

  static const String neckPain = 'neckPain';
  static const String neckPainTitle = 'Neck Pain';

  static const String changeOfConsciousness = 'changeOfConsciousness';
  static const String changeOfConsciousnessTitle = 'Change of consciousness';

  static const String takingAntiCoagulants = 'takingAntiCoagulants';
  static const String takingAntiCoagulantsTitle = 'Taking anticoagulants';

  static const String cutsOrLacerations = 'cutsOrLacerations';
  static const String cutsOrLacerationsTitle = 'Cuts or lacerations';

  static const String unableToWeightBear = 'unableToWeightBear';
  static const String unableToWeightBearTitle = 'Unable to weightBear';

  // Other Info Page
  static const String otherInfo = 'otherInfo';
  static const String otherInfoHint = 'Other information';

  // Terms and Conditions
  static const String termsConditions = ''' Terms & Conditions
Daniel Christopher Hug and Nick Leigh Muir (ABN 61 120 854 679) trading as ‘Hug Health’ (“HH”, “we”) owns and operates the HH software application that allows users to log patient falls and record associated data (the “App”). The services offered by HH include the App, any HH branded URL, HH mobile services and any other features, content, or applications offered from time to time by HH in connection with the App (collectively, the “Services”).
By accessing the Services you agree to the terms and conditions as updated from time to time (“Terms and Conditions”). You agree that HH may change and update the Terms and Conditions from time to time and the most recent version of the Terms and Conditions posted on HH’s website or available via the App will apply and bind you. We recommend that you review the Terms and Conditions regularly at www.hughealth.com.au
The Terms of Use include the terms and conditions set out below and any other terms and conditions that appear in or are linked to HH. 

Content on the Services
1.	You are solely responsible for your conduct and any data, text, photos, videos, scripts, graphics, sounds, music, audio, audiovisual combinations, interactive features and other content and materials (together "Content") that you post, submit, upload, display or otherwise make available (“submit”) by using the Services. 
2.	You represent and warrant that you:
(a)	own all of the Content that you submit on or using the Services; or  
(b)	are authorised to submit any Content submitted by you to or using the Services.
3.	You must not submit any Content that:
(a)	is defamatory or malicious; 
(b)	is illegal, misleading or deceptive, contains images of children, is obscene, offensive, indecent, depicts nudity, sexual activity or violence, is unsuitable for children or that prevents other users from enjoying the Services;
(c)	infringes, or may infringe, on any intellectual property right; or
(d)	infringes, or may infringe, on any property rights of a third party without first obtaining the consent of that third party. For example, you must not submit any personal information of a third party without obtaining the consent of that third party. 
4.	HH is not responsible for any Content submitted by third parties or for any material on any third party sites linked via the Services. 
5.	HH may edit or remove any Content submitted by you at any time without giving any explanation or justification for editing or removing the Content.  
Using the Services 
6.	You can set up an account to use the Services by [insert process of creating account] (your “Account”).
(a)	The service will be loaded privately to smartphone or tablet devices through the Apple Business Distribution;
(b)	User access levels will be controlled using Firebase Authentication with custom claims. Roles and permissions can be defined to meet individual business requirements;
7.	You can record details of a fall incident by following the visual and text prompts in the Services. You may enter the following details in relation to incidents:
(a)	the persons name;
(b)	the time and location of the incident;
(c)	details of the scene and conditions at the time of the incident;
(d)	Subjective and objective assessment findings at the time of the incident;
(e)	Edit details retrospectively as required; 
 (in each case, an “Incident Report”).
8.	Once you have completed an Incident Report, you can follow the visual and text prompts in the Services to send the Incident Report to a recipient of your choosing. [elaborate as necessary] 
9.	Your complete and incomplete Incident Reports can be stored and accessed in the Services.
10.	Together, all information and details that you enter into your Account and Incident Reports are your Content.
11.	You must not: 
(a)	submit, or use the Services to send, any unauthorized commercial communications (such as spam); 
(b)	access the Services using automated means; 
(c)	upload viruses or other malicious code to the Services; 
(d)	bypass any measure HH may use to prevent or restrict access to the Services, any part of the Services or any other software, systems or networks connected to the Services;
(e)	decipher, decompile, disassemble, reverse engineer or otherwise attempt to derive any source code or underlying algorithms of any part of the Services;
(f)	create derivative works of any part of the Services;
(g)	rent, lease, lend, sell, transfer, redistribute, or sublicense the Services;
(h)	not do anything that could disable, overburden, or impair the proper working of the Services, such as a denial of service attack; or 
(i)	let anyone else access your Account.
Intellectual Property 
12.	In these Terms and Conditions, Intellectual Property Rights means all and any patents, patent applications, trade marks, service marks, trade names, registered designs, unregistered design rights, copyrights, know how, trade secrets, business names, domain names, internet addresses, telephone and fax numbers, post office boxes, rights in confidential information, and all and any other intellectual property rights, whether registered or unregistered, and including all applications and rights to apply for any of the same.
13.	Subject to clause 14, HH owns, or is licensed to use, the Intellectual Property Rights in:
(a)	the Services;
(b)	the content, data, graphics, photographs, images, trade marks, trade names, material and other information HH submits in or makes accessible via the Services; and
(c)	all software forming part of, or used in connection with, the Services including all software code, source code, object code, binary code, executable code, modules, components, dynamic link libraries, executable programs, architectural models, process models, object models, database schemas, accompanying or associated media, business rules, algorithms, configurations, backups, updates, service packs, patches and hot fixes,
(“HH Material”). 
14.	HH acknowledges that it does not own Intellectual Property Rights in:
(a)	source code forming part of, or used in connection with, the Services which was obtained by the developer of the Services under an open source license; or
(b)	dynamic link libraries provided by a handset manufacturer or embedded in the operating system.  [to be confirmed]
15.	You must not reproduce, customise, reverse engineer, decipher, decompile, modify, disassemble, incorporate the HH Material in whole or in part in any other software or product, or develop derivative works of the HH Material or allow others to do so or upload or re-submit the HH Material to any other site on the internet without obtaining HH’s prior, written consent.
16.	For Content that is covered by Intellectual Property Rights, by submitting the Content, you grant HH a perpetual, non-exclusive, transferable, sub-licensable, irrevocable, royalty-free, worldwide license to use, republish and modify any Content that you submit on or in connection with the Services, including the right to sub-license the rights to the Content.
17.	The license granted in clause 16 includes uploading or linking Content to any open source software repository which may be viewed, downloaded and edited by third parties for their own purposes. 
HH Liability 
18.	HH prohibits conduct in breach of these Terms and Conditions. You agree that HH is not responsible for the Content submitted on the Services by other users and that you use the Services at your own risk. 
19.	HH does not warrant guarantee or make any representation:
(a)	that your use of the Services is legal;
(b)	as to the performance of the Services; 
(c)	that the Services or any part of it will operate uninterrupted or are error-free; 
(d)	that errors and defects in the Services will be corrected; or
(e)	that the Services will be updated. 
20.	While HH has taken reasonable steps to ensure the information provided is accurate and up to date, HH does not warrant the reliability, accuracy, correctness or completeness of any of the information or services provided on the Services. You must rely solely on you own assessments and verification of the Content.
21.	While HH will use reasonable efforts to minimise the risk of the software viruses, trojans and malicious code, HH cannot, and does not, warrant guarantee or make any representation that the Services, or the server that makes the Services available online are free of software viruses, trojans or any malicious code.
22.	HH has the right to monitor and moderate Content but is not responsible for the removal or deletion of any Content.  
23.	HH and its respective officers, employees, contractors and agents have no liability for any costs, losses or damages of any kind, which you or anyone else may incur, arising whether directly or indirectly in connection with your use of the Services. 
24.	HH is not liable to you for:
(a)	any expenses or costs to you associated with your use of the Services (including any data charges incurred by you);
(b)	loss of any Content;
(c)	errors or omissions in the Services, or linked sites on the Services;
(d)	delays to, interruptions of or cessation of the services provided in the Services, or linked sites; 
(e)	defamatory, offensive or illegal conduct of any user of the Services,
whether caused through negligence of the Services, its employees or contractors, or through any other cause.
25.	You agree that you will bear the full cost of any necessary repair, correction and maintenance of any of your smartphone or computer software or hardware, which may be necessary as a consequence of you installing or using the Services.
26.	You agree to at all times indemnify and keep indemnified HH and its respective officers, employees, contractors and agents (each a "HH Officer") from and against any loss (including reasonable legal costs and expenses) or liability incurred by any HH Officer arising from any claim, demand, suit, action or proceeding by any person against any of those indemnified where such loss or liability arose out of, in connection with or in respect of any breach of these Terms and Conditions by you, your use of the Services or publication of or distribution of Content or information supplied by you.
Your Privacy 
27.	When you create an Account in connection with the Services, HH will ask you to provide certain personal information. 
28.	You must not provide any false information to HH.
29.	The personal information provided by you, any Content you submit on the Services and information regarding the way you access the Services from your computer, mobile phone or other device make up the “information” collected by HH.
30.	Subject to your rights under any applicable privacy law, you agree that HH may use information provided to HH by you or gathered by HH in connection with your use of the Services for HH’s technical development, product development, marketing, funding, research and support purposes (including contacting you if there is an issue with your Account), provided that HH will not disclose any information that is identifiable as information relating to you.
31.	You acknowledge that when you submit Content to HH that Content may be shared with third parties for research and development purposes.
32.	HH undertakes to comply with the National Privacy Principles as set out in the Privacy Act (1988) in respect of all information collected by HH.
Australian Consumer Law
33.	The Australian Consumer Law Schedule of the Competition and Consumer Act 2010 (Cth) provides consumer rights and remedies that may not be contracted out of, in part or wholly. Where those consumer rights and remedies apply to the provision of the Services to you and cannot be contracted out of, they apply and override any inconsistent provisions in these Terms and Conditions but only to the extent of the inconsistency. 
34.	Where you are entitled to a statutory right or term that HH are not able to exclude but HH are entitled to limit your remedy for a breach of that right or term, then HH’s liability for breach of that right or term is limited to (at HH’s election):   
(a)	in the case of goods HH supplies, the repair or replacement of the goods or the supply of substitute goods (or payment of the cost of doing so); or   
(b)	in the case of services HH supplies, the supplying of the services again, or the payment of the cost of having the services supplied again. 
Termination of access
35.	HH may terminate or suspend your access to the Services at any time without giving you any explanation or justification for the termination of your access. 
36.	You agree that HH has no liability for any costs, losses or damages of any kind arising as a consequence of terminating your access to the Services.
Other 
37.	These Terms and Conditions represent the entire agreement between you and HH on the subject matter. All representations, communications and prior agreements in relation to the subject matter are merged in and superseded by these Terms and Conditions. 
38.	You acknowledge that HH may assign its interest in the Services at any time.
39.	If any part of these Terms and Conditions are found to be void, unlawful, or unenforceable then that part will be deemed to be severable from the balance of these Terms and Conditions and the severed part will not affect the validity and enforceability of any remaining provisions.
40.	These Terms and Conditions will be governed by and interpreted in accordance with the law of the Western Australia and you agree to the jurisdiction of the courts of Western Australia to determine any dispute arising out of these Terms and Conditions.
41.	If you access the Services in a place outside Western Australia you agree to comply with all laws in force in that place in addition to the Terms and Conditions and all laws in Western Australia. You must not, in the use of the Services, violate any laws in your jurisdiction (including but not limited to copyright laws).
''';


  // Privacy Policy
  static const String privacyPolicy = ''' HUG HEALTH PRIVACY POLICY 
Who we are 
Daniel Christopher Hug and Nick Muir (ABN 61 120 854 679) trading as ‘Hug Health’ (“HH” or “we”) owns and operates the HH software application that allows users to log patient falls and associated fall data  (the “App”). 
The services offered by HH include the App, the website located at www.hughealth.com.au (the HH Website), any HH mobile services and any other features, content or applications offered from time to time by HH using the App or in connection with the App (collectively, the “Services”).
This document should be read in conjunction with HH’s Terms of Use, which are available on HH’s website at www.hughealth.com.au
Words defined in the Terms of Use have the same meaning within this Privacy Policy unless otherwise defined.
1.	What is this Privacy Policy about?
At HH we respect the privacy of your personal information in our care and are committed to protecting the privacy of the personal information we collect and receive. 
The purpose of this Privacy Policy is to explain:
(a)	the application of this Privacy Policy;
(b)	the kind of information we collect about you, how we collect it, and how we use it;
(c)	how we may disclose that information;
(d)	how you can access the information we hold about you;
(e)	when we may use your information to contact you;
(f)	the protection of your personal information; and
(g)	our use of cookies to collect information, and how you can control or delete these cookies (if implemented within the Services).
This policy also informs you of your rights to privacy and describes how we comply with our privacy requirements as set out in the Privacy Act 1988 (Cth) (the Privacy Act) and the Privacy Amendment (Enhancing Privacy Protection) Act 2012 (Cth). The Australian Privacy Principles contained in the Privacy Act govern the way in which we collect, use, disclose, store, secure and dispose of your personal information.
This Privacy Policy also deals with how we collect, manage, store and disclose your “personal information”. Certain parts of this Privacy Policy also apply to “sensitive information”. These terms are discussed below.  
2.	Consent
By using the Services you consent to the privacy practices set out in this policy.  If you do not agree with the policy and consent please discontinue use of the Services.  
3.	Personal information
Personal information is information or an opinion that can be used to identify you or which allows your identity to be worked out from the information. This might include personal details like your name, address, date of birth, other contact information like your email address and phone number and financial information like your credit card number or bank details. It may also include your opinions about our services and our staff, as well as any information sent to us through correspondence.
4.	Sensitive Information 
Sensitive information is a type of personal information. Sensitive information can include information like your racial or ethnic origin, health information, political opinions, membership of a political association, professional or trade association or trade union and criminal record. We are required by the Privacy Act to ask for your consent to collect sensitive information. We generally do not collect sensitive information, however we may collect sensitive information from you if it is necessary to provide you with the Services. When we talk about personal information in this Privacy Policy, we mean personal information and sensitive information, including health information.  
5.	The kind of personal information HH collects and holds
The personal information we collect and hold will depend on our dealings with you. The different kinds of personal information we collect and hold about individuals includes:
(a)	names;
(b)	contact details, including address, phone number and email address;
(c)	signatures;
(d)	dates of birth;
(e)	opinions about our services and staff; and 
(f)	any information sent to us through correspondence.

[add  / remove as necessary]:
a.	 I have removed employment details; credit card details;bank account details;financial details; including information regarding your salary or wages; 

6.	How HH collects your personal information
HH  collects personal information about you in a number of ways, including: 
(a)	from you directly by personal contact when you create an account as well as through mail, telephone, email and online communications and interactions; and
(b)	your account activity when you use the Services.
7.	Why HH Collects Your Personal Information
HH collects personal information for a number of reasons including:
(a)	to communicate with you;
(b)	to determine whether we are able to provide the Services to you and to determine the applicable fee payable by you for the Services; 
(c)	to supply the Services to you;
(d)	to manage and administer your relationship with us, including processing payments, accounting, auditing, billing and collection and support services to provide the Services to you;
(e)	for marketing purposes; 
(f)	to measure our performance and to improve the Services, including for the quality assurance of the Services;
(g)	for analysis of the Services;
(h)	to develop the Services; 
(i)	to better understand your requirements and preferences and improve the Services;
(j)	to recruit employees;
(k)	to perform other administrative functions, such as maintaining your client file; 
(l)	to obtain and maintain insurance; 
(m)	to comply with legal requirements; and
(n)	for purposes directly related to any of the above. 
8.	Use and disclosure of your personal information
We disclose your personal information to third parties for the following purposes:
(a)	to provide you with the Services;
(b)	to store our data; 
(c)	to improve our services; 
(d)	for  research purposes; 
(e)	for quality assurance purposes;
(f)	if permitted or required by law or a governmental authority; 
(g)	to obtain and maintain insurance, or if required by our insurer in connection with a claim; or
(h)	for any other purpose, with your consent.
We may also provide your personal information to our related bodies corporate and our service providers who assist us with customer contact, archival, auditing, accounting, legal, business consulting, banking, delivery, data processing, website or technology services. We will take reasonable and practicable steps to ensure third parties we deal with take steps to protect your privacy. All of our employees are required to maintain the confidentiality of any personal information held by us.
We may also need to disclose your personal information to our advisors, including our accountants and lawyers. 
HH uses hosting companies that may have servers that are physically located overseas. HH may also use service providers and contractors located overseas, and your personal information may be disclosed to them. HH will take reasonable steps to ensure that any overseas recipient complies with the Privacy Act. You should also be aware that where data is hosted overseas, access to and use of that personal information will be governed by laws that apply in those overseas locations. 
HH may share aggregated, non-personally identifiable information publicly, for example, to show trends about the general use of Services or for research purposes.
We will never sell your personal information to anyone. 
Generally we will not disclose your personal information to anyone overseas, except if we are required to do this by law or if it is necessary to provide you with the services you have requested from us
9.	Direct Marketing
From time to time we may use the personal information collected from you for direct marketing purposes.  If we do contact you in this way, it will only be in relation to matters that customers would reasonably expect us to contact them directly about.   
We will ask for your consent before we use your personal information for marketing purposes if we have not collected that personal information directly from you.
If you receive marketing offers from us and do not wish to receive them in the future, please use the ‘unsubscribe’ link provided in those electronic communications.
10.	Security of Your Personal Information
We may hold your personal information in physical and electronic form both at our premises and with the assistance of our service providers. We implement a range of measures to protect the security of that information. We are also required to take reasonable steps to destroy or de-identify information when no longer needed for any permitted purpose.
If you are considering sending us any personal information electronically, please be aware that the information may be insecure in transit, particularly where no encryption is used (e.g. email, standard http). You agree that, even though HH uses reasonable endeavours to secure your personal information, HH cannot guarantee that any information sent or accessed electronically is secure.
You may also assist HH in keeping your personal information secure by maintaining the confidentiality of your account information and notifying HH immediately if there is any unauthorised use of your account, or any other breach of security relating to your account.
In the unlikely event of a suspected data breach, HH will within 30 days assess and evaluate whether a breach has occurred and will, if required, notify the relevant data protection authority unless the breach is not likely to present any risk to your rights.
11.	Cookies 
Data collection devices, called “cookies”, are files placed on your electronic devices to collect information. HH may use cookies to enhance the use of the Services. Cookies can record information about your visit to assist us in better understanding your needs and requirements. You should be aware that any Internet browser you use will generally be set to automatically accept cookies.
If you do not want any cookies to be placed on your electronic devices, you can alter your browser settings to refuse to accept cookies. However, this may also limit the way you can use the Services if we use cookies.
12.	Destroying personal information 
HH will destroy, or take reasonably commercial steps to de-identify, personal information when this is no longer required by us.
13.	Links
The Services may contain links to Third Party Websites. HH  is not responsible for the information on these sites, or their privacy policies. HH  may keep track of your interactions with Third Party Websites provided on the Services in order to improve the Services and to aggregate statistics.
14.	Accuracy of your information
HH takes all reasonable precautions to ensure that the personal information it collects, uses and discloses is accurate, complete and up-to-date. However, the accuracy of that information depends to a large extent on the information you provide. We therefore recommend that you: 
(a)	let us know if there are any errors in your personal information we hold; and 
(b)	keep us up-to-date with changes to personal information you have previously provided.
15.	Your rights in relation to personal information 
Under the Privacy Act you have the right to request access to your personal information that is held by us about you. You also have the right to request correction of any of your personal information that we hold. 
Please contact us if you would like to request access to the personal information we hold about you. You will need to put your request in writing for, security reasons, and send it to the using the contact details as set out in paragraph 16 below.  Please provide us with as much detail as you can about the particular information you seek, in order to help us retrieve it.  We will use commercially reasonable endeavours to provide the information within 10 business days of receiving your request. Please note that HH may charge a fee to cover the cost of meeting your request.
You are able to change or update your account information at any time through the Services.
16.	Complaints
If you believe that the privacy of your personal information is not effectively protected, or if you are concerned that your privacy has been compromised through the dissemination of your personal information, please contact us using the contact details as set out below:

By email: daniel@hughealth.com.au
Attention: Daniel Hug
We take all enquiries seriously and will attend to your question or complaint promptly. If you are not happy with the way we deal with your privacy complaint you can make a complaint to the Privacy Commissioner at the Office of the Australian Information Commission (OAIC).  More information about making a complaint to OAIC is available at http://www.oaic.gov.au/privacy/privacy-complaints
17.	Amendments
HH  may review and amend this Privacy Policy from time to time. If HH does make amendments, the amended Privacy Policy will be published on the HH website. 
You agree that it is your responsibility to check for updates to HH’s Privacy Policy. You further agree that your continued use of the Services is acceptance of HH’s amendments to the Privacy Policy.
Policy last updated February 2020

 ''';


}
