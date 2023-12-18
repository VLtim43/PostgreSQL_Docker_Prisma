FROM oven/bun

WORKDIR /app

COPY bun.lockb .
COPY package.json .

RUN bun install
COPY . . 
EXPOSE 8080
RUN bunx prisma generate
RUN bunx prisma migrate dev


CMD ["bun", "start"]
