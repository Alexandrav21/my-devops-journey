# Networking Fundamentals Cheat Sheet (with AWS)

> **Purpose:** These notes are designed as a learning guide, not just a list of facts. Networking is one of the core skills for Cloud, AWS and DevOps engineers because almost every problem eventually comes down to ßnetworking.

------------------------------------------------------------------------

# What You'll Learn

This guide covers:

-   OSI Model & TCP/IP
-   IP Addressing & Subnetting (CIDR)
-   DNS and Domain Resolution
-   HTTP, HTTPS & TLS
-   Load Balancers & Reverse Proxies
-   Firewalls & Security Groups
-   Common Ports & Protocols
-   Routing & NAT
-   AWS Networking (VPCs, Subnets, Route Tables, Security Groups, NACLs,
    Route53, Load Balancers)

------------------------------------------------------------------------

# Why Networking Matters

Understanding networking is crucial for:

-   Debugging connectivity problems
-   Designing secure cloud infrastructure
-   Building scalable applications
-   Understanding AWS networking services
-   Working with Kubernetes, Docker and microservices

If a website won't load, an EC2 instance can't reach an RDS database, or a Kubernetes pod can't communicate with another service, networking is usually the first place you'll investigate.

------------------------------------------------------------------------

# OSI Model vs TCP/IP

## OSI Model (7 Layers)

**Mnemonic:** *Please Do Not Throw Sausage Pizza Away*

  ------------------------------------------------------------------------
  Layer                 Purpose                 Examples
  --------------------- ----------------------- --------------------------
  7\. Application       User-facing services    HTTP, HTTPS, DNS

  6\. Presentation      Encryption & formatting TLS, SSL, JSON

  5\. Session           Maintains communication Authentication sessions
                        sessions                

  4\. Transport         Reliable delivery       TCP, UDP

  3\. Network           Routing                 IP, Routers

  2\. Data Link         Local communication     MAC Addresses, Switches

  1\. Physical          Hardware                Cables, Fibre, WiFi
  ------------------------------------------------------------------------

## TCP/IP Model

The Internet actually uses a simpler four-layer model:

-   Application
-   Transport
-   Internet
-   Network Access

AWS documentation generally refers to the TCP/IP model rather than OSI.

------------------------------------------------------------------------

# IP Addressing & CIDR

## IPv4

Example:

192.168.1.10

32-bit addressing.

## IPv6

Example:

2001:db8::1

128-bit addressing.

## Private IP Ranges

-   10.0.0.0/8
-   172.16.0.0/12
-   192.168.0.0/16

AWS VPCs typically use one of these ranges.

## CIDR

CIDR tells you how much of an IP address belongs to the network.

Example:

192.168.1.0/24

The /24 means the first 24 bits represent the network.

Common subnet sizes:

  CIDR     Total IPs
  ------ -----------
  /24            256
  /25            128
  /26             64
  /27             32
  /28             16

Subnet mask:

255.255.255.0 = /24

------------------------------------------------------------------------

# DNS

DNS is the Internet's phone book. Instead of remembering IP addresses, we remember names like:

google.com

DNS converts that into an IP address.

## Resolution Process

Browser
↓
Recursive Resolver
↓
Root Server
↓
TLD Server (.com)
↓
Authoritative Server
↓
Returns IP Address


## Common Records

-   A → IPv4
-   AAAA → IPv6
-   CNAME → Alias
-   MX → Mail
-   TXT → Verification

AWS equivalent: **Amazon Route53**

------------------------------------------------------------------------

# HTTP, HTTPS & TLS

## HTTP

-   Uses Port 80
-   Plain text
-   Not encrypted

## HTTPS

-   Uses Port 443
-   Encrypts traffic using TLS
-   Protects passwords and sensitive data

## TLS

TLS creates a secure encrypted connection between client and server.

In AWS you'll commonly see TLS certificates managed by **AWS Certificate Manager (ACM)** and terminated on an **Application Load Balancer (ALB)**.

------------------------------------------------------------------------

# Load Balancers & Reverse Proxies

## Load Balancer

Distributes requests across multiple servers.

Benefits:

-   High Availability
-   Scalability
-   Fault Tolerance

AWS Services:

-   Application Load Balancer (ALB)
-   Network Load Balancer (NLB)

## Reverse Proxy

Sits in front of your application.

Common examples:
-   NGINX
-   Apache

Can provide:
-   SSL termination
-   Caching
-   Authentication
-   Routing

------------------------------------------------------------------------

# Firewalls & Security

## Traditional Firewall

Controls network traffic entering and leaving a network.

## AWS Security Groups

Instance-level firewall.
-   Stateful
-   Default deny inbound
-   Allow only required traffic


## Network ACLs

Subnet-level firewall.
-   Stateless
-   Applies to entire subnet

Think:

Security Group = Protects the instance

NACL = Protects the subnet

------------------------------------------------------------------------

# Common Ports & Protocols

  Port    Protocol     Purpose
  ------- ------------ ------------------------
  20/21   FTP          File Transfer
  22      SSH          Secure Remote Login
  25      SMTP         Sending Email
  53      DNS          Name Resolution
  80      HTTP         Websites
  110     POP3         Email Retrieval
  143     IMAP         Email Retrieval
  443     HTTPS        Secure Websites
  3306    MySQL        Database
  5432    PostgreSQL   Database
  6379    Redis        Cache
  3389    RDP          Windows Remote Desktop

Remember:

**IP** identifies the machine while **port** identifies the application.

------------------------------------------------------------------------

# AWS Networking Overview

-   **VPC** = Your private network inside AWS
-   **Subnet** = Smaller section of a VPC
-   **Route Table** = Decides where traffic goes
-   **Internet Gateway** = Internet access for public subnets
-   **NAT Gateway** = Lets private subnets access the internet
-   **Security Groups** = Stateful firewall
-   **Network ACLs** = Stateless subnet firewall
-   **Route53** = Managed DNS
-   **ALB/NLB** = Load balancing

Typical architecture:

Internet
↓
Route53
↓
Application Load Balancer
↓
EC2 / ECS / EKS
↓
Private RDS Database

Everything lives inside a VPC and is protected by **Security Groups** and **Route Tables**.
