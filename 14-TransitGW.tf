# Transit Gateway ONE in each region

resource "aws_ec2_transit_gateway" "tgw_ap_northeast_1" {
  provider = aws.ap-northeast-1
  description = "Transit Gateway for ap-northeast-1 Tokyo"
}

resource "aws_ec2_transit_gateway" "tgw_us_east_1" {
  provider = aws.us-east-1
  description = "Transit Gateway for us-east-1 New York"
}

resource "aws_ec2_transit_gateway" "tgw_eu_west_2" {
  provider = aws.eu-west-2
  description = "Transit Gateway for eu-west-2 London"
}

resource "aws_ec2_transit_gateway" "tgw_sa_east_1" {
  provider = aws.sa-east-1
  description = "Transit Gateway for sa-east-1 Sao Paulo"
}

resource "aws_ec2_transit_gateway" "tgw_ap_southeast_2" {
  provider = aws.ap-southeast-2
  description = "Transit Gateway for ap-southeast-2 Sydney"
}

resource "aws_ec2_transit_gateway" "tgw_ap_east_1" {
  provider = aws.ap-east-1
  description = "Transit Gateway for ap-east-1 Hong Kong"
}
resource "aws_ec2_transit_gateway" "tgw_us_west_1" {
  provider = aws.us-west-1
  description = "Transit Gateway for us-west-1 California"
}

# Inter-region peering connections
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_us-east-1" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_us_east_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "us-east-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "us-east-1_to_ap-northeast-1" {
  provider                = aws.us-east-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_us_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_eu-west-2" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_eu_west_2.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "eu-west-2"
}
resource "aws_ec2_transit_gateway_peering_attachment" "eu-west-2_to_ap-northeast-1" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_eu_west_2.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_sa-east-1" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_sa_east_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "sa-east-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "sa-east-1_to_ap-northeast-1" {
  provider                = aws.sa-east-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_sa_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_ap-southeast-2" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_southeast_2.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-southeast-2"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-southeast-2_to_ap-northeast-1" {
  provider                = aws.ap-southeast-2
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_southeast_2.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_ap-east-1" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_east_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-east-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-east-1_to_ap-northeast-1" {
  provider                = aws.ap-east-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "ap-northeast-1_to_us-west-1" {
  provider                = aws.ap-northeast-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_us_west_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "us-west-1"
}
resource "aws_ec2_transit_gateway_peering_attachment" "us-west-1_to_ap-northeast-1" {
  provider                = aws.us-west-1
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_us_west_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  #peer_account_id         = "<YOUR_AWS_ACCOUNT_ID>"
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_us_east_1" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_us_east_1_to_ap_northeast_1" {
  provider                   = aws.us-east-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_eu_west_2" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_eu_west_2_to_ap_northeast_1" {
  provider                   = aws.eu-west-2
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_sa_east_1" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_sa_east_1_to_ap_northeast_1" {
  provider                   = aws.sa-east-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_ap_southeast_2" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_southeast_2_to_ap_northeast_1" {
  provider                   = aws.ap-southeast-2
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_ap_east_1" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_east_1_to_ap_northeast_1" {
  provider                   = aws.ap-east-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_us_west_1" {
  provider                   = aws.ap-northeast-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_us_west_1_to_ap_northeast_1" {
  provider                   = aws.us-west-1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_ap_northeast_1.id
}

# Add Transit Gateway Route Tables and Routes (Optional)
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_us_east_1" {
  provider          = aws.us-east-1
  transit_gateway_id = aws_ec2_transit_gateway.tgw_us_east_1.id
}

resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1a" {
  provider                    = aws.us-east-1
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_ap_northeast_1" {
  provider          = aws.ap-northeast-1
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
}

resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1b" {
  provider                    = aws.ap-northeast-1
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_northeast_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_eu_west_2" {
  provider          = aws.eu-west-2
  transit_gateway_id = aws_ec2_transit_gateway.tgw_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1c" {
  provider                    = aws.eu-west-2
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_eu_west_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_sa_east_1" {
  provider          = aws.sa-east-1
  transit_gateway_id = aws_ec2_transit_gateway.tgw_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1d" {
  provider                    = aws.sa-east-1
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_sa_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_ap_southeast_2" {
  provider          = aws.ap-southeast-2
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1e" {
  provider                    = aws.ap-southeast-2
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_southeast_2.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_ap_east_1" {
  provider          = aws.ap-east-1
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_west_1f" {
  provider                    = aws.ap-east-1
  destination_cidr_block      = "10.236.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_ap_east_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_us_west_1.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rt_us_west_1" {
  provider          = aws.us-west-1
  transit_gateway_id = aws_ec2_transit_gateway.tgw_us_west_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_northeast_1g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.230.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_ap_northeast_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_us_east_1g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.231.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_us_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_eu_west_2g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.232.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_eu_west_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_sa_east_1g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.233.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_sa_east_1.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_southeast_2g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.234.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_ap_southeast_2.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rt_route_ap_east_1g" {
  provider                    = aws.us-west-1
  destination_cidr_block      = "10.235.0.0/16" # Adjust CIDR block as needed
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_us_west_1.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_ap_east_1.id
}