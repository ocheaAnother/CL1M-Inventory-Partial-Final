module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '39e1339a4992b803d83357731c6b88e3'),
  },
});
