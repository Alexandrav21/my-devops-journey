# Networking Fundamentals Cheat Sheet (with AWS)

## What is Networking?

Networking is simply devices communicating with each other. 
Think of: 
- IP Address = house address - MAC Address = hardware identity - Port =
apartment/door 
- DNS = phone book - Router = road system 
- Packet = parcel

## LAN vs WAN

-   **LAN**: Small network (home, office).
-   **WAN**: Connects multiple LANs (the Internet).

## Network Devices

### Switch

-   Connects devices in the same LAN.
-   Uses MAC addresses.
-   AWS analogy: communication within a subnet.

### Router

-   Connects different networks.
-   Uses IP addresses.
-   AWS analogy: Route Tables + Internet Gateway.

### Firewall

-   Allows or blocks traffic.
-   AWS analogy:
    -   Security Groups (stateful)
    -   Network ACLs (stateless)

## IP Addressing

### IPv4

Example: 192.168.1.10 (32-bit)

### IPv6

Example: 2001:db8::1 (128-bit)

Private ranges: - 10.0.0.0/8 - 172.16.0.0/12 - 192.168.0.0/16

## MAC Address

48-bit hardware identifier. Example: 00:18:2B:AA:BB:CC

## Ports

22 SSH 53 DNS 80 HTTP 443 HTTPS 3389 RDP

IP finds the computer. Port finds the application.

## TCP vs UDP

TCP: - Reliable - Three-way handshake - Error checking - Web, SSH, Email

UDP: - Faster - No handshake - Streaming, Gaming, DNS

## OSI Model

1.  Physical
2.  Data Link
3.  Network
4.  Transport
5.  Session
6.  Presentation
7.  Application

Mnemonic: Please Do Not Throw Sausage Pizza Away

## TCP/IP Model

-   Network Access
-   Internet
-   Transport
-   Application

## DNS

Translates names into IP addresses.

Resolution: Client -\> Resolver -\> Root -\> TLD -\> Authoritative -\>
IP

Records: - A = IPv4 - AAAA = IPv6 - CNAME = Alias - MX = Mail - TXT =
Verification

AWS DNS service: Route53

## Routing

Routing decides the best path.

Static = manual Dynamic = OSPF/BGP

## Subnetting

Splits networks into smaller ones.

CIDR examples: - /24 = 256 IPs - /25 = 128 - /26 = 64 - /27 = 32 - /28 =
16

Subnet mask: 255.255.255.0 = /24

Remember powers of 2: 1 2 4 8 16 32 64 128 256

## NAT

Converts private IPs to public.

-   Static NAT = 1:1
-   Dynamic NAT = pool
-   PAT = many devices share one public IP

## Troubleshooting

ping traceroute nslookup dig

Useful: dig +short google.com

## AWS Networking

### VPC

Your private network in AWS.

### Subnets

Public and Private.

### Route Tables

Control where traffic goes.

### Internet Gateway

Allows public internet access.

### NAT Gateway

Lets private subnets reach the internet.

### Security Groups

Instance firewall -> Stateful

### Network ACLs

Subnet firewall -> Stateless

### Elastic Load Balancer

Distributes traffic.

### Route53

Managed DNS.

## Common AWS Architecture

Internet ↓ Route53 ↓ Load Balancer ↓ EC2 / ECS / EKS ↓ Private Database

All inside a VPC protected by Security Groups and Route Tables.

## Commands

ping google.com traceroute google.com nslookup google.com dig google.com
curl ifconfig.me ip addr

## Memory Tricks

-   Switch = same network
-   Router = different networks
-   DNS = phone book
-   IP = address
-   MAC = hardware ID
-   Port = application door
-   TCP = reliable
-   UDP = fast
-   VPC = AWS network
-   Security Group = instance firewall
-   NACL = subnet firewall
-   NAT Gateway = internet for private subnets
