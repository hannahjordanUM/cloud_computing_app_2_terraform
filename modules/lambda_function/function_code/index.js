const movies = [
    "Schindlers List",
    "Shawshank Redemption",
    "Batman The Dark Knight",
    "Spider-Man: No Way Home",
    "Avengers",
];

exports.handler = async (event) => {
    return {
        statusCode: 200,
        headers: {
            "Content-Type": "applications/json",
        },
        body: JSON.stringify({ movies }),
    };
};