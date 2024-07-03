resource "aws_instance" "test" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.ec2-test-sg.id}"]
  key_name               = aws_key_pair.key-tf.key_name
  tags = {
    Name = "test-instance"
  }
  user_data = file("${path.module}/script.sh")

  connection { #it will establish connection and provision the file according to code written manner
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {                #type of provisioner - file, local-exec, remote-exec
    on_failure = continue             #this cmd helps to continue the next provisioners if this fails, not marking ec2 tainted
    source      = "readme.md"         #it will copy the file from terraform executing machine to server
    destination = "/tmp/readme.md"
  }

  provisioner "file" {                      #type of provisioner - file, local-exec, remote-exec
    content     = "This is Ashish's server" #it will copy the content mention here to /tmp/content-file.md
    destination = "/tmp/content-file.md"
  }

  provisioner "local-exec" {             #type of provisioner - file, local-exec, remote-exec
    working_dir = "/tmp"                 #by specifying work directory, below cmd will paste the result in /tmp/my-pub-ip.txt file   
    command     = "echo ${self.public_ip} > my-pub-ip.txt"
  }

  provisioner "local-exec" {
    when    = destroy                    #this provisioner will work at the time of destroying
    command = "echo 'at delete'"
  }

  provisioner "remote-exec" {            #type of provisioner - file, local-exec, remote-exec
    inline = [                             
      "ifconfig > /tmp/ifconfig.output"   
    ]
  }
}