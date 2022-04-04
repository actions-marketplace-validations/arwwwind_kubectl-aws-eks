FROM amazon/aws-cli

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.5/bin/linux/amd64/kubectl && \
    curl -o /usr/local/bin/aws-iam-authenticator https://raw.githubusercontent.com/arwwwind/kubectl-aws-eks/master/aws-iam-authenticator_0.5.5_darwin_amd64 && \
    chmod +x /usr/local/bin/aws-iam-authenticator && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/bin/kubectl  

RUN kubectl version --client
RUN aws-iam-authenticator version
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
