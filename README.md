# OpenControl Proof of Concept

Proof of concept for using OpenControl to generate an application's
System Security Plan (SSP).

OpenControl has three types of inputs:

- Standards: Standards are groups of security controls.  For example, the NIST
  800-53 standard contains the AC-2 Account Management security control (among
  others).
- Certifications: Certifications are subsets of security controls that must be
  met in order to achieve a certification.  For example, the FedRAMP moderate
  certification requires meeting particular NIST 800-53 security controls.
- Components: Components are system components that meet security controls.
  For example, the AWS IAM (Identity and Access Management) component meets the
  AC-2 security control (among others).

For the proof of concept, we're considering the Geography API application to be
seeking the [Lightweight
ATO](https://gsablogs.gsa.gov/innovation/2014/12/10/it-security-security-in-an-agile-development-cloud-world-by-kurt-garbars/)
certification, which references the [NIST 800-53
standard](https://github.com/opencontrol/NIST-800-53-Standards).  The Geography
API implements some controls and also inherits [AWS component
controls](https://github.com/opencontrol/aws-compliance) because it runs on
AWS.

## How to

### Setup

Install [compliance-masonry](https://github.com/opencontrol/compliance-masonry)
and [gitbook-cli](https://github.com/GitbookIO/gitbook-cli).

### Generate the SSP

```
$ make pdf  # Generates ssp.pdf
$ open ssp.pdf
```

### List unimplemented controls

```
$ make diff
```

## TODO

- Create AWS component yaml specific to how we use AWS. We reference [18F's AWS
  components](https://github.com/opencontrol/aws-compliance) which include
  information specific to how 18F uses AWS. For example, the AWS CloudFormation
  component includes "18F provisions its infrastructure with AWS
  CloudFormation".

- Create certification yaml based on the [CMSR (Centers for Medicare & Medicaid
  Services Minimum Security Requirements) Moderate controls](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/CMS1222632.html).

- Create standards yaml for additional controls that are specific to the
  Centers for Medicare & Medicaid Services (CMS).
