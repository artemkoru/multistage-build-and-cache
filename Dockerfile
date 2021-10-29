FROM busybox as builder

RUN touch /somefile

# very log build command here
RUN sleep 60

FROM busybox

COPY --from=builder /somefile / 