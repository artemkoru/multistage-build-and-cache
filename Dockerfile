FROM busybox as builder

# very log build command here
RUN sleep 15

COPY somefile .

FROM busybox

COPY --from=builder /somefile / 