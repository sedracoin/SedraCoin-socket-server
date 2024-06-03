# encoding: utf-8

from server import sedrad_client


async def get_network():
    """
    Get some global sedra network information
    """
    resp = await sedrad_client.request("getBlockDagInfoRequest")
    return resp["getBlockDagInfoResponse"]
