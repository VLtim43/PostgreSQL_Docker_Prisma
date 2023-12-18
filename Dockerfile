FROM oven/bun

COPY bun.lockb . 
COPY package.json .

RUN bun install --forzen-lockfile


COPY src ./src 